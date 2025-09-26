// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Uint8List get toDart
/// Converts this [JSUint8Array] to a [Uint8List] by either casting or
/// wrapping it.
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, [Uint8List]s are [JSUint8Array]s and this
/// operation will be a cast.
///
/// When compiling to Wasm, the [JSUint8Array] is wrapped with a [Uint8List]
/// implementation and the wrapper is returned.
///
/// Modifications to this [JSUint8Array] will affect the returned [Uint8List]
/// and vice versa.
///
/// @description Check that when compiling to JavaScript this operation is a
/// cast and returns the same object. When compiling to Wasm this operation is a
/// wrapping but `a.toDart.toJS` returns object equal to `a`.
/// @author sgrekhov22@gmail.com
/// @issue 61543

import 'dart:js_interop';
import '../../../Utils/expect.dart';

main() {
  JSUint8Array a = JSUint8Array.withLength(1);
  if (isJS) {
    // This is a cast. Object is the same
    Expect.identical(a, a.toDart);
    Expect.identical(a, a.toDart.toJS);
  }
  Expect.equals(a, a.toDart.toJS);
}
