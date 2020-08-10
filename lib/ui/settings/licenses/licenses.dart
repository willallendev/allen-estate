import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

void setupLicenses() {
  LicenseRegistry.addLicense(() async* {
    final googleFontLicense = await rootBundle.loadString('google_fonts/LICENSE.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], googleFontLicense);
  });
}
