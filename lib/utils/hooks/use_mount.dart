import 'package:flutter/foundation.dart';
import 'package:lumiere_note_sp/utils/hooks/use_effect_once.dart';

void useMount(VoidCallback fn) {
  return useEffectOnce(() {
    fn();
    return null;
  });
}
