import 'package:core_module/core_module.dart';
import 'package:get/instance_manager.dart';
import 'package:post_module/src/data/local/impl/post_local_datasource_impl.dart';
import 'package:post_module/src/data/local/post_local_datasource.dart';
import 'package:post_module/src/data/remote/impl/post_remote_datasource_impl.dart';
import 'package:post_module/src/data/remote/post_remote_datasource.dart';
import 'package:post_module/src/data/repo/post_repo_impl.dart';
import 'package:post_module/src/domain/repos/post_repo.dart';
import 'package:post_module/src/presentation/viewmodels/post_details_view_model.dart';

class PostDetailsInjector implements Injector {
  @override
  void inject() {
    Logger.log("inject story details dependencies");
    Get.create<PostLocalDatasource>(
        () => PostLocalDatasourceImpl(DatabaseModule().postDao));
    Get.create<PostRemoteDatasouce>(
        () => PostRemoteDatasourceImpl(Get.find<ApiManager>()));
    Get.create<PostRepo>(() => PostRepoImpl(Get.find(), Get.find()));
    // no neet to inject repo when you are not in web because it already injected
    Get.lazyPut(() => PostDetailsViewModel(Get.find()));
  }
}
