// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Checks that an external js interop setter can be augmented by
/// augmenting variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

external set topLevelSetter(int value);

@JS()
augment int topLevelSetter;

@JS()
extension type ET(JSObject _) implements JSObject {
  external static set staticSetter(int value);
  external static int get staticSetter;
  external set instanceSetter(int value);
  external int get instanceSetter;
}

augment extension type ET {
  augment static int staticSetter;
  augment int instanceSetter;
}

main() {
  eval(r'''
    Object.defineProperty(globalThis, "topLevelSetter", {
      set: function(v) { globalThis.topLevelValue = v; },
      configurable: true
    });
    
    class ET {
      static set staticSetter(v) {
        ET._staticVal = v;
      }
      static get staticSetter() {
        return ET._staticVal;
      }
      set instanceSetter(v) {
        this._instanceVal = v;
      }
      static get instanceSetter() {
        return this._instanceVal;
      }
    }
    globalThis.ET = ET;
    globalThis.et = new ET();
  ''');

  topLevelSetter = 1;
  Expect.equals(1, (globalContext["topLevelValue"] as JSNumber).toDartInt);
  ET et = ET(globalContext["et"] as JSObject);
  ET.staticSetter = 2;
  Expect.equals(2, ET.staticSetter);
  et.instanceSetter = 3;
  Expect.equals(3, et.instanceSetter);
}
