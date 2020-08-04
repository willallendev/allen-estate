import 'package:allenrealestateflutter/ui/containers/home/home.dart';
import 'package:allenrealestateflutter/ui/containers/re_category/re_category.dart';
import 'package:allenrealestateflutter/ui/containers/re_search_results/re_search_results.dart';
import 'package:allenrealestateflutter/ui/containers/re_single/re_single.dart';
import 'package:auto_route/auto_route_annotations.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    AdaptiveRoute(page: HomeContainer, initial: true, name: 'home'),
    AdaptiveRoute(page: ReSearchResultsContainer, name: 'reSearchResults', path: '/real-estate-results'),
    AdaptiveRoute(page: ReSingleContainer, name: 'reSingle', path: '/real-estate/:id'),
    AdaptiveRoute(page: ReCategoryContainer, name: 'reCategory', path: '/real-estate/category/:categoryId'),
  ],
)
class $Router {}
