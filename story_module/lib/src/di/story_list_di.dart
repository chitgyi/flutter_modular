import 'package:core_module/core_module.dart';
import 'package:get/instance_manager.dart';
import 'package:story_module/src/data/local/impl/story_local_datasource_impl.dart';
import 'package:story_module/src/data/local/story_local_datasource.dart';
import 'package:story_module/src/data/remote/story_remote_data_source.dart';
import 'package:story_module/src/data/remote/impl/story_remote_datasource_impl.dart';
import 'package:story_module/src/data/repo/story_repo_impl.dart';
import 'package:story_module/src/domain/repository/story_repo.dart';
import 'package:story_module/src/presentation/viewmodels/story_viewmodel.dart';

class StoryListDi implements Injector {
  @override
  void inject() {
    Logger.log("inject story list dependencies");
    Get.create<StoryLocalDatasouce>(
        () => StoryLocalDatasourceImpl(DatabaseModule().storyDao));
    Get.create<StoryRemoteDataSource>(
        () => StoryRemoteDatasourceImpl(Get.find<ApiManager>()));
    Get.create<StoryRepo>(() => StoryRepoImpl(Get.find(), Get.find()));
    Get.lazyPut(() => StoryViewModel(Get.find()));
  }
}
