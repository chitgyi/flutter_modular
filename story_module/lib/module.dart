import 'package:core_module/core_module.dart';
import 'package:story_module/generated/locales.g.dart';
import 'package:story_module/src/di/story_list_di.dart';
import 'package:story_module/src/presentation/pages/story_details_page.dart';
import 'package:story_module/src/presentation/pages/story_list_page.dart';
import 'package:story_module/src/utils/routes.dart';

class StoryModule implements Module {
  @override
  List<AppPage> get pages => [
        AppPage(
          page: () {
            StoryListDi().inject();
            return const StoryListPage();
          },
          routeName: StoryRoutes.stories,
          isInitalRoute: true,
        ),
        AppPage(
          page: () => const StoryDetailsPage(),
          routeName: StoryRoutes.storyDetails,
        ),
      ];

  @override
  Map<String, Map<String, String>> get translations =>
      AppTranslation.translations;
}
