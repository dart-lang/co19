// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSArrayBuffer( int length, [ JSObject options ])
/// Creates a JavaScript `ArrayBuffer` of size `length` using an optional
/// `options` JavaScript object that sets the `maxByteLength`.
///
/// @description Check that this constructor creates a JavaScript `ArrayBuffer`
/// of size `length`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  globalContext["a0"] = JSArrayBuffer(0);
  eval("globalThis.length0 = a0.byteLength;");
  Expect.equals(0, (globalContext["length0"] as JSNumber).toDartInt);

  globalContext["a1"] = JSArrayBuffer(1);
  eval("globalThis.length1 = a1.byteLength;");
  Expect.equals(1, (globalContext["length1"] as JSNumber).toDartInt);

  globalContext["a16"] = JSArrayBuffer(16);
  eval("globalThis.length16 = a16.byteLength;");
  Expect.equals(16, (globalContext["length16"] as JSNumber).toDartInt);
}
