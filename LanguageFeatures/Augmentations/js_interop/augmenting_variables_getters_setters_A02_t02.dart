// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Checks that an external js interop setter can be augmented by
/// an augmenting setter. Test the case when an introductory declaration is
/// incomplete.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

@JS()
set topLevelSetter(int value);

augment external set topLevelSetter(int value);

extension type ET(JSObject _) implements JSObject {
  static set staticSetter(int value);
  external static int get staticGetter;
  set instanceSetter(int value);
  external int get instanceGetter;
}

augment extension type ET {
  augment external static set staticSetter(int value);
  augment external set instanceSetter(int value);
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
      static get staticGetter() {
        return ET._staticVal;
      }
      set instanceSetter(v) {
        this._instanceVal = v;
      }
      get instanceGetter() {
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
  Expect.equals(2, ET.staticGetter);
  et.instanceSetter = 3;
  Expect.equals(3, et.instanceGetter);
}
