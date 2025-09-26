// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSInt32Array get toJS
/// Converts this [Int32List] to a [JSInt32Array] by either casting,
/// unwrapping, or cloning the [Int32List].
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, all typed lists are the equivalent
/// JavaScript typed arrays, and therefore this getter simply casts.
///
/// When compiling to Wasm, this [Int32List] is a wrapper around a
/// `Int32Array` if it was converted via [JSInt32ArrayToInt32List.toDart]. If
/// it is a wrapper, this getter unwraps it and returns the `Int32Array`. If
/// it's instantiated in Dart, this getter clones this [Int32List]'s values
/// into a new [JSInt32Array].
///
/// Avoid assuming that modifications to this [Int32List] will affect the
/// returned [JSInt32Array] and vice versa on all compilers unless it was
/// converted first via [JSInt32ArrayToInt32List.toDart].
///
/// @description Check that when compiling to JavaScript this operation is a
/// cast and returns the same object. When compiling to Wasm this operation is a
/// wrapping and returns not the same object.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:typed_data';
import '../../../Utils/expect.dart';

main() {
  Int32List l = Int32List.fromList([42]);
  if (isJS) {
    // This is a cast. Object is the same
    Expect.identical(l, l.toJS);
    Expect.identical(l, l.toJS.toDart);
  }
  if (isWasm) {
    // This is a wrapping/unwrapping. It can be not the same object.
    Expect.listEquals(l.toList(), l.toJS.toDart.toList());
  }
}
