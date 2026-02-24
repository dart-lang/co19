// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Checks that an external js interop getter can be augmented by
/// an augmenting getter. Test the case when an introductory declaration is
/// complete.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

external int get topLevelGetter;

@JS()
augment int get topLevelGetter;

extension type ET(JSObject _) implements JSObject {
  external static int get staticGetter;
  external int get instanceGetter;
}

augment extension type ET {
  augment static int get staticGetter;
  augment int get instanceGetter;
}

main() {
  eval(r'''
    globalThis.topLevelGetter = 1;
    
    class ET {
      static get staticGetter() {
        return 2;
      }
      get instanceGetter() {
        return 3;
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
