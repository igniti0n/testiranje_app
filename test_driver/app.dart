import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_complete_guide/main.dart' as app;

void main() {
  //this will look for app_test to run tests
  enableFlutterDriverExtension();
  app.main();
}
