// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension, extension type, mixin, or mixin class
/// declaration can be marked with an `augment` modifier
///
/// @description Checks that an js interop extension type can be augmented.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

extension type ET(JSObject _) implements JSObject {
  external int id();
}

@JS()
augment extension type ET {}

main() {
  eval(r'''
    class ET {
      id() {
        return 42;
      }
    }
    globalThis.et = new ET();
  ''');
  ET et = ET(globalContext["et"] as JSObject);
  Expect.equals(42, et.id());
}
