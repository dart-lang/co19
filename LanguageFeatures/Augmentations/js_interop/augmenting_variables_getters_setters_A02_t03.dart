// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Checks that an external js interop setter can be augmented by
/// an augmenting variable. Test the case when an introductory declaration is
/// complete.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

external set topLevelSetter(int value);

@JS()
augment abstract int topLevelSetter;

// TODO (sgrekhov) This test does not include static abstract variable
// declarations because the grammar doesn't derive them. See
// https://github.com/dart-lang/language/issues/4592

extension type ET(JSObject _) implements JSObject {
  external set instanceSetter(int value);
  external int get instanceSetter;
}

augment extension type ET {
  augment abstract int instanceSetter;
}

main() {
  eval(r'''
    Object.defineProperty(globalThis, "topLevelSetter", {
      set: function(v) { globalThis.topLevelValue = v; },
      configurable: true
    });
    
    class ET {
      set instanceSetter(v) {
        this._instanceVal = v;
      }
      get instanceSetter() {
        return this._instanceVal;
      }
    }
    globalThis.ET = ET;
    globalThis.et = new ET();
  ''');

  topLevelSetter = 1;
  Expect.equals(1, (globalContext["topLevelValue"] as JSNumber).toDartInt);
  ET et = ET(globalContext["et"] as JSObject);
  et.instanceSetter = 3;
  Expect.equals(3, et.instanceSetter);
}
