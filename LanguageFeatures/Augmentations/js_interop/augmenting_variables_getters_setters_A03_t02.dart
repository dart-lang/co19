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
abstract int topLevelVariable;

augment external int topLevelVariable;

// TODO (sgrekhov) This test does not include static abstract variable
// declarations because the grammar doesn't derive them. See
// https://github.com/dart-lang/language/issues/4592

extension type ET(JSObject _) implements JSObject {
  abstract int instanceVariable;
}

augment extension type ET {
  augment external int instanceVariable;
}

main() {
  eval(r'''
    globalThis.topLevelVariable = 1;
    
    class ET {
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
  Expect.equals(3, et.instanceVariable);
  et.instanceVariable = 33;
  Expect.equals(33, et.instanceVariable);
}
