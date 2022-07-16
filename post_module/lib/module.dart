import 'package:core_module/core_module.dart';
import 'package:post_module/generated/locales.g.dart';
import 'package:post_module/src/di/post_details_injector.dart';
import 'package:post_module/src/di/post_list_injector.dart';
import 'package:post_module/src/presentation/pages/post_details_page.dart';
import 'package:post_module/src/presentation/pages/post_list_page.dart';
import 'package:post_module/src/utils/routes.dart';

class PostModule implements Module {
  @override
  List<AppPage> get pages => [
        AppPage(
          page: () => const PostListPage(),
          routeName: PostRoutes.posts,
          isInitalRoute: true,
          injector: PostInjector(),
        ),
        AppPage(
          page: () => const PostDetailsPage(),
          routeName: PostRoutes.postDetails,
          injector: PostDetailsInjector(),
        ),
      ];

  @override
  Map<String, Map<String, String>> get translations =>
      AppTranslation.translations;
}
