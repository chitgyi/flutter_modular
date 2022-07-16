import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_module/src/presentation/viewmodels/post_details_view_model.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<PostDetailsViewModel>()..loadPost();
    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (context, child) => viewModel.value.observe(
          (value) => SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 14.0),
                Text(value.body),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
