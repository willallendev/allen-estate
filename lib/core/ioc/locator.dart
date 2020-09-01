import 'package:allenrealestateflutter/core/ioc/locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

const dev = Environment('dev');
const test = Environment('test');
const prod = Environment('prod');
final locator = GetIt.instance;

@injectableInit
void setupLocator() => $initGetIt(locator, environment: prod.name);
