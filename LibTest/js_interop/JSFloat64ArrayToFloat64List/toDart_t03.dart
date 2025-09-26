// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Float64List get toDart
/// Converts this [JSFloat64Array] to a [Float64List] by either casting or
/// wrapping it.
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, [Float64List]s are [JSFloat64Array]s and
/// this getter will be a cast.
///
/// When compiling to Wasm, the [JSFloat64Array] is wrapped with a
/// [Float64List] implementation and the wrapper is returned.
///
/// Modifications to this [JSFloat64Array] will affect the returned
/// [Float64List] and vice versa.
///
/// @description Check that when compiling to JavaScript this operation is a
/// cast and returns the same object. When compiling to Wasm this operation is a
/// wrapping but `a.toDart.toJS` returns object equal to `a`.
/// @author sgrekhov22@gmail.com
/// @issue 61543

import 'dart:js_interop';
import '../../../Utils/expect.dart';

main() {
  JSFloat64Array a = JSFloat64Array.withLength(1);
  if (isJS) {
    // This is a cast. Object is the same
    Expect.identical(a, a.toDart);
    Expect.identical(a, a.toDart.toJS);
  }
  Expect.equals(a, a.toDart.toJS);
}
