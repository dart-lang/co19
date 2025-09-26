// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion ByteBuffer get toDart
/// Converts this [JSArrayBuffer] to a [ByteBuffer] by either casting or
/// wrapping it.
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, [ByteBuffer]s are [JSArrayBuffer]s and this
/// operation will be a cast.
///
/// When compiling to Wasm, the [JSArrayBuffer] is wrapped with a [ByteBuffer]
/// implementation and the wrapper is returned.
///
/// Modifications to this [JSArrayBuffer] will affect the returned
/// [ByteBuffer] and vice versa.
///
/// @description Check that in case of `dart2js` this operation is a cast and
/// therefore returns the same object.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  if (isJS) {
    eval("globalThis.ab1 = new ArrayBuffer(2);");
    JSArrayBuffer ab1 = globalContext["ab1"] as JSArrayBuffer;
    Expect.identical(ab1, ab1.toDart);

    JSArrayBuffer ab2 = JSArrayBuffer(2);
    Expect.identical(ab2, ab2.toDart);
  }
}
