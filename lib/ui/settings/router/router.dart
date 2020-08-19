import 'package:allenrealestateflutter/ui/containers/about_us/about_us.dart';
import 'package:allenrealestateflutter/ui/containers/home/home.dart';
import 'package:allenrealestateflutter/ui/containers/re_category/re_category.dart';
import 'package:allenrealestateflutter/ui/containers/re_popular_list/re_popular_list.dart';
import 'package:allenrealestateflutter/ui/containers/re_search_results/re_search_results.dart';
import 'package:allenrealestateflutter/ui/containers/re_single/re_single.dart';
import 'package:allenrealestateflutter/ui/containers/where_to_find_us/where_to_find_us.dart';
import 'package:allenrealestateflutter/ui/screens/description_single/description_single.dart';
import 'package:allenrealestateflutter/ui/screens/gallery_single/gallery_single.dart';
import 'package:auto_route/auto_route_annotations.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    AdaptiveRoute(page: HomeContainer, initial: true, name: 'home'),
    AdaptiveRoute(page: AboutUsContainer, name: 'aboutUs', path: '/about-us'),
    AdaptiveRoute(page: WhereToFindUsContainer, name: 'whereToFindUs', path: '/where-to-find-us'),
    AdaptiveRoute(page: ReSearchResultsContainer, name: 'reSearchResults', path: '/real-estates'),
    AdaptiveRoute(page: ReSingleContainer, name: 'reSingle', path: '/real-estates/single/:id'),
    AdaptiveRoute(page: DescriptionSingleScreen, name: 'reSingleDescription', path: '/real-estates/single/:id/description'),
    AdaptiveRoute(page: GallerySingleScreen, name: 'reSingleGallery', path: '/real-estates/single/:id/gallery'),
    AdaptiveRoute(page: ReCategoryContainer, name: 'reCategory', path: '/real-estates/categories/:categoryId'),
    AdaptiveRoute(page: RePopularListContainer, name: 'rePopularList', path: '/real-estates/popular'),
  ],
)
class $Router {}
