import 'package:allenrealestateflutter/ui/containers/home/home.dart';
import 'package:auto_route/auto_route_annotations.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    AdaptiveRoute(page: HomeContainer, initial: true, name: 'home'),
  ],
)
class $Router {}
