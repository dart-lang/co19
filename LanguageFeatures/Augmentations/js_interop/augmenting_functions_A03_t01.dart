// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Check that a js interop extension type with external
/// static methods can be augmented.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

@JS()
extension type ET(JSObject _) implements JSObject {
  external static int f1();
  external static int f2(int v);
}

augment extension type ET {
  augment static int f1();
  augment static f2(v);
}

main() {
  eval(r'''
    class ET {
      static f1() {
        return 1;
      }
      static f2(v) {
        return v;
      }
    }
    globalThis.ET = ET;
  ''');

  Expect.equals(1, ET.f1());
  Expect.equals(2, ET.f2(2));
}
