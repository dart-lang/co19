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
/// @description Check that this getter converts this [JSArrayBuffer] to a
/// [ByteBuffer]. Test [JSArrayBuffer] created in Dart.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';

main() {
  JSArrayBuffer ab = JSArrayBuffer(2);
  JSInt16Array ar = JSInt16Array(ab);
  ar["0"] = 42.toJS;
  ByteBuffer bb = ab.toDart;
  Expect.equals(42, bb.asInt16List()[0]);

  bb.asInt16List()[0] = 1;
  Expect.equals(1, (ar["0"] as JSNumber).toDartInt);

  if (isJS) {
    // Casting case.
    Expect.identical(ab, ab.toDart.toJS);
  }
  if (isWasm) {
    // Wrapping/unwrapping case
    Expect.notIdentical(ab, ab.toDart.toJS);
  }
}
