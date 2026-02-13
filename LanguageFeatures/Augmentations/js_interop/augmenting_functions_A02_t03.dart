// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Check that a js interop extension type with external methods
/// can be augmented.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

@JS()
extension type ET(JSObject _) implements JSObject {
  external int f1();
  external int f2(int v);
}

augment extension type ET {
  @JS('foo')
  augment int f1();
  @JS('bar')
  augment f2(v);
}

main() {
  eval(r'''
    class ET {
      constructor(x) {
        this.v = x;
      }
      foo() {
        return this.v;
      }
      bar(v) {
        return v;
      }
    }
    globalThis.et = new ET(1);
  ''');

  ET et = ET(globalContext["et"] as JSObject);
  Expect.equals(1, et.f1());
  Expect.equals(2, et.f2(2));
}
