// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension, extension type, mixin, or mixin class
/// declaration can be marked with an `augment` modifier
///
/// @description Checks that an js interop class can be augmented.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../LibTest/js_interop/js_utils.dart';
import '../../../Utils/expect.dart';

class C {
  external factory C({String s, int n, bool b});
}

@anonymous
@staticInterop
@JS()
augment class C {}

main() {
  var c = C(s: "s value", n: 42, b: true);
  globalContext["c"] = c as JSObject;
  eval(r'''
    globalThis.resS = globalThis.c.s;
    globalThis.resN = globalThis.c.n;
    globalThis.resB = globalThis.c.b;
  ''');
  Expect.equals("s value", (globalContext["resS"] as JSString).toDart);
  Expect.equals(42, (globalContext["resN"] as JSNumber).toDartInt);
  Expect.equals(true, (globalContext["resB"] as JSBoolean).toDart);
}
