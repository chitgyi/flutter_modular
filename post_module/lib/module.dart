import 'package:core_module/core_module.dart';
import 'package:post_module/generated/locales.g.dart';
import 'package:post_module/src/pages/Post_details_page.dart';
import 'package:post_module/src/pages/Post_list_page.dart';
import 'package:post_module/src/utils/routes.dart';

class PostModule implements Module {
  @override
  List<AppPage> get pages => [
        AppPage(
          page: () => const PostListPage(),
          routeName: PostRoutes.posts,
          isInitalRoute: true,
        ),
        AppPage(
          page: () => const PostDetailsPage(),
          routeName: PostRoutes.postDetails,
        ),
      ];

  @override
  Map<String, Map<String, String>> get translations =>
      AppTranslation.translations;
}
