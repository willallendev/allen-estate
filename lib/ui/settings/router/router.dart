import 'package:allenrealestateflutter/ui/containers/home/home.dart';
import 'package:allenrealestateflutter/ui/containers/re_search_results/re_search_results.dart';
import 'package:auto_route/auto_route_annotations.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    AdaptiveRoute(page: HomeContainer, initial: true, name: 'home'),
    AdaptiveRoute(page: ReSearchResultsContainer, name: 'reSearchResults', path: '/real-estate-results'),
  ],
)
class $Router {}
