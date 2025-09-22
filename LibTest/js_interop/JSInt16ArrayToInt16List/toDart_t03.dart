// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Int16List get toDart
/// Converts this [JSInt16Array] to a [Int16List] by either casting or
/// wrapping it.
///
/// When compiling to JavaScript, [Int16List]s are [JSInt16Array]s and this
/// operation will be a cast. When compiling to Wasm, a wrapper is introduced.
/// Modifications to this [JSInt16Array] will affect the [Int16List] and vice
/// versa.
///
/// @description Check that when compiling to JavaScript this operation is a
/// cast and returns the same object. When compiling to Wasm this operation is a
/// wrapping but `a.toDart.toJS` returns the same object `a`.
/// @author sgrekhov22@gmail.com
/// @issue 61543

import 'dart:js_interop';
import '../../../Utils/expect.dart';

main() {
  JSInt16Array a = JSInt16Array.withLength(1);
  if (isJS) {
    // This is a cast. Object is the same
    Expect.identical(a, a.toDart);
  }
  Expect.identical(a, a.toDart.toJS);
}
