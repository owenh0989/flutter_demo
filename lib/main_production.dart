import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lumiere_note_sp/config/flavors.dart';
import 'package:lumiere_note_sp/initialize.dart';
import 'package:lumiere_note_sp/lumiere_note_sp_app.dart';
import 'package:lumiere_note_sp/presentation/view_models/base/logger_provider_observable.dart';

Future<void> main() async {
  F.appFlavor = Flavor.PRODUCTION;
  await initialize();
  runApp(
    ProviderScope(
        observers: []..addAll([LoggerProviderObservable()]),
        child: LumiereNoteSpApp()),
  );
}
