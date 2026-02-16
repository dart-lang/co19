// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Checks that an external js interop variable can be augmented by
/// augmenting setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

@JS()
int topLevelVariable;

augment external set topLevelVariable(int value);
// We also need aa external getter, otherwise the declaration will be incomplete
// after applying of all augmentations
augment external get topLevelVariable;

@JS()
extension type ET(JSObject _) implements JSObject {
  static int staticVariable;
  int instanceVariable;
}

augment extension type ET {
  augment external static set staticVariable(int value);
  augment external set instanceVariable(int value);
  augment external get instanceVariable;
}

main() {
  eval(r'''
    globalThis.topLevelVariable = 0;
    
    class ET {
      static staticVariable = 0;
      constructor() {
        this.instanceVariable = 0;
      }
    }
    globalThis.ET = ET;
    globalThis.et = new ET();
  ''');

  topLevelVariable = 1;
  Expect.equals(1, (globalContext["topLevelVariable"] as JSNumber).toDartInt);

  ET.staticVariable = 2;
  eval("globalThis.staticValue = ET.staticVariable");
  Expect.equals(2, (globalContext["staticValue"] as JSNumber).toDartInt);

  ET et = ET(globalContext["et"] as JSObject);
  et.instanceVariable = 3;
  eval("globalThis.instanceValue = globalThis.et.instanceVariable");
  Expect.equals(3, (globalContext["instanceValue"] as JSNumber).toDartInt);
}
