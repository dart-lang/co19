// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Checks that an external js interop getter can be augmented by
/// augmenting variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

external int get topLevelGetter;

@JS()
augment final int topLevelGetter;

@JS()
extension type ET(JSObject _) implements JSObject {
  external static int get staticGetter;
  external int get instanceGetter;
}

augment extension type ET {
  augment static final int staticGetter;
  augment final int instanceGetter;
}

main() {
  eval(r'''
    globalThis.topLevelGetter = 1;
    
    class ET {
      static get x() {
        return ET._x;
      }
      get instanceGetter() {
        return 2;
      }
    }
    globalThis.ET = ET;
    globalThis.et = new ET();
  ''');
  Expect.equals(1, topLevelGetter);
  ET et = ET(globalContext["et"] as JSObject);
  Expect.equals(2, ET.staticGetter);
  Expect.equals(3, et.instanceGetter);
}
