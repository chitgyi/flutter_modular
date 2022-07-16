import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:story_module/src/presentation/pages/story_details_page.dart';
import 'package:story_module/src/presentation/viewmodels/story_viewmodel.dart';

class StoryListPage extends StatelessWidget {
  const StoryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<StoryViewModel>();
    viewModel.loadStories();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Story List"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle),
            onPressed: () => viewModel.insertFakerStory(),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (context, child) => viewModel.value.observe(
          (stoires) => ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            itemCount: stoires.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(stoires[index].title),
              subtitle: Text(stoires[index].createdAt.toString()),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const StoryDetailsPage(),
          ),
        ),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
