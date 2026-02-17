// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Checks that an external js interop variable can be augmented by
/// an augmenting variable. Test the case when an introductory declaration is
/// incomplete.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

@JS()
int topLevelVariable;

augment external int topLevelVariable;

extension type ET(JSObject _) implements JSObject {
  static int staticVariable;
  int instanceVariable;
}

augment extension type ET {
  augment external static int staticVariable;
  augment external int instanceVariable;
}

main() {
  eval(r'''
    globalThis.topLevelVariable = 1;
    
    class ET {
      static staticVariable = 2;
      constructor() {
        this.instanceVariable = 3;
      }
    }
    globalThis.ET = ET;
    globalThis.et = new ET();
  ''');

  Expect.equals(1, topLevelVariable);
  topLevelVariable = 42;
  Expect.equals(42, topLevelVariable);

  ET et = ET(globalContext["et"] as JSObject);
  Expect.equals(2, ET.staticVariable);
  ET.staticVariable = 22;
  Expect.equals(22, ET.staticVariable);
  Expect.equals(3, et.instanceVariable);
  et.instanceVariable = 33;
  Expect.equals(33, et.instanceVariable);
}
