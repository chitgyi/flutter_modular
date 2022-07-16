import 'package:core_module/core_module.dart';
import 'package:get/instance_manager.dart';
import 'package:post_module/src/data/local/impl/post_local_datasource_impl.dart';
import 'package:post_module/src/data/local/post_local_datasource.dart';
import 'package:post_module/src/data/remote/impl/post_remote_datasource_impl.dart';
import 'package:post_module/src/data/remote/post_remote_datasource.dart';
import 'package:post_module/src/data/repo/post_repo_impl.dart';
import 'package:post_module/src/domain/repos/post_repo.dart';
import 'package:post_module/src/presentation/viewmodels/posts_view_model.dart';

class PostInjector implements Injector {
  @override
  void inject() {
    Logger.log("inject story list dependencies");
    Get.create<PostLocalDatasource>(
        () => PostLocalDatasourceImpl(DatabaseModule().postDao));
    Get.create<PostRemoteDatasouce>(
        () => PostRemoteDatasourceImpl(Get.find<ApiManager>()));
    Get.create<PostRepo>(() => PostRepoImpl(Get.find(), Get.find()));
    Get.lazyPut(() => PostsViewModel(Get.find()));
  }
}
