import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:lumiere_note_sp/utils/shared_preferences_util.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPreferencesUtil.getInstance();
  Intl.defaultLocale = 'ja';
}
