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
/// @description Check that in case of `dart2js` this operation is a cast and
/// therefore returns the same object. In case of `dart2wasm` it is not the same
/// object.
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
  if (isJS) {
    Expect.identical(dv, dv.toDart);
  }
  if (isWasm) {
    Expect.notIdentical(dv, dv.toDart);
  }
}
