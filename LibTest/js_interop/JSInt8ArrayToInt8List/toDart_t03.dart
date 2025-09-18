// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Int8List get toDart
/// Converts this [JSInt8Array] to a [Int8List] by either casting or wrapping
/// it.
///
/// When compiling to JavaScript, [Int8List]s are [JSInt8Array]s and this
/// operation will be a cast. When compiling to Wasm, a wrapper is introduced.
/// Modifications to this [JSInt8Array] will affect the [Int8List] and vice
/// versa.
///
/// @description Check that when compiling to JavaScript this operation is a
/// cast and returns the same object. When compiling to Wasm this operation is a
/// wrapping and returns not the same object.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  JSInt8Array a = JSInt8Array.withLength(1);
  if (isJS) {
    // This is a cast. Object is the same
    Expect.identical(a, a.toDart);
    Expect.identical(a, a.toDart.toJS);
  }
  if (isWasm) {
    // This is a wrapping/unwrapping. It's not the same object
    Expect.notIdentical(a, a.toDart);
    Expect.notIdentical(a, a.toDart.toJS);
    jsExpectArrayEquals(a, a.toDart.toJS);
  }
}
