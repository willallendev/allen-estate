import 'package:allenrealestateflutter/ui/containers/home/home.dart';
import 'package:auto_route/auto_route_annotations.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: HomeContainer, initial: true),
  ],
)
class $Router {}
