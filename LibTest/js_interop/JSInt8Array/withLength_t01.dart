// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSInt8Array.withLength( int length )
/// Creates a JavaScript `Int8Array` of size `length` whose elements are
/// initialized to `0`.
///
/// @description Checks that this constructor creates a JavaScript
/// `Int8Array` of size `length` whose elements are initialized to `0`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

test(int length) {
  JSInt8Array ar = JSInt8Array.withLength(length);
  globalContext["ar"] = ar;
  eval(r'''
    globalThis.length = ar.length;
    globalThis.byteOffset = ar.byteOffset;
  ''');
  Expect.equals(length, (globalContext["length"] as JSNumber).toDartInt);
  Expect.equals(0, (globalContext["byteOffset"] as JSNumber).toDartInt);
  for (int i = 0; i < length; i++) {
    eval("globalThis.v$i = ar[$i];");
    Expect.equals(0, (globalContext["v$i"] as JSNumber).toDartInt);
  }
}

main() {
  test(0);
  test(1);
  test(3);
}
