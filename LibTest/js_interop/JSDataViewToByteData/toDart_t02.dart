// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion ByteData get toDart
/// Converts this [JSDataView] to a [ByteData] by either casting or wrapping
/// it.
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, [ByteData]s are [JSDataView]s and this
/// operation will be a cast.
///
/// When compiling to Wasm, the [JSDataView] is wrapped with a [ByteData]
/// implementation and the wrapper is returned.
///
/// Modifications to this [JSDataView] will affect the returned [ByteData] and
/// vice versa.
///
/// @description Check that this getter converts this [JSDataView] to a
/// [ByteData] and the changes in [ByteData] object modify [JSDataView] as well.
/// Test [JSDataView] created in Dart.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  JSArrayBuffer ab = JSArrayBuffer(2);
  JSInt16Array ar = JSInt16Array(ab);
  ar["0"] = 42.toJS;
  JSDataView dv = JSDataView(ab);
  ByteData bd = dv.toDart;
  Expect.equals(42, bd.getInt16(0, Endian.little));

  bd.setInt16(0, 333);
  globalContext["dv"] = dv;
  eval("globalThis.res = globalThis.dv.getInt16(0);");
  Expect.equals(333, (globalContext["res"] as JSNumber).toDartInt);
}
