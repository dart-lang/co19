// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Common library for js_interop tests.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';

@JS()
external void eval(String code);

void jsExpectEquals(JSAny? expected, JSAny? actual) {
  if (isJS) {
    Expect.equals(expected, actual);
    return;
  }
  if (isWasm) {
    Expect.equals(expected.dartify(), actual.dartify());
    return;
  }
  throw Exception("Only dart2js and dart2wasm compilers supported");
}

void jsExpectArrayEquals(JSAny? expected, JSAny? actual) {
    Expect.listEquals(expected.dartify(), actual.dartify());
}
