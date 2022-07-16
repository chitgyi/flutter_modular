import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:story_module/story_module.dart';
import 'package:post_module/src/utils/routes.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post List")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: null,
            tooltip: 'Posts',
            onPressed: () => Get.toNamed(PostRoutes.PostDetails),
            child: const Icon(Icons.info),
          ),
          FloatingActionButton(
            tooltip: 'Stories',
            heroTag: null,
            onPressed: () => Get.toNamed(StoryRoutes.stories),
            child: const Icon(Icons.newspaper),
          ),
        ],
      ),
      body: const Center(
        child: Text("Post List Page"),
      ),
    );
  }
}
