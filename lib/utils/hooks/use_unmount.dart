import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lumiere_note_sp/utils/hooks/use_effect_once.dart';

void useUnmount(VoidCallback fn) {
  final fnRef = useRef(fn)..value = fn;
  return useEffectOnce(() => () => fnRef.value());
}
