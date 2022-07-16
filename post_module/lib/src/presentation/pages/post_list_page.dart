import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_module/src/presentation/viewmodels/posts_view_model.dart';
import 'package:story_module/story_module.dart';
import 'package:post_module/src/utils/routes.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<PostsViewModel>()..loadPosts();
    return Scaffold(
      appBar: AppBar(title: const Text("Post List")),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Stories',
        onPressed: () => Get.toNamed(StoryRoutes.stories),
        child: const Icon(Icons.newspaper),
      ),
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (context, child) => viewModel.value.observe(
          (posts) => ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            itemCount: posts.length,
            itemBuilder: ((context, index) => ListTile(
                  title: Text(posts[index].title),
                  subtitle: Text(
                    posts[index].body,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => Get.toNamed(
                    PostRoutes.postDetails.replaceAll(
                      ":id",
                      posts[index].id.toString(),
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
