// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion ByteData get toDart
/// Converts this [JSDataView] to a [ByteData] by either casting or wrapping
/// it.
///
/// When compiling to JavaScript, [ByteData]s are [JSDataView]s and this
/// operation will be a cast. When compiling to Wasm, a wrapper is introduced.
/// Modifications to this [JSDataView] will affect the [ByteData] and vice
/// versa.
///
/// @description Check that this getter converts this [JSDataView] to a
/// [ByteData]. Test [JSDataView] created in JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.ab = new ArrayBuffer(2);
    globalThis.dv = new DataView(globalThis.ab);
    globalThis.dv.setInt16(0, 42);
  ''');
  JSDataView dv = globalContext["dv"] as JSDataView;
  ByteData bd = dv.toDart;
  Expect.equals(42, bd.getInt16(0));

  bd.setInt16(0, 333);
  eval("globalThis.res = globalThis.dv.getInt16(0);");
  Expect.equals(333, (globalContext["res"] as JSNumber).toDartInt);
}
