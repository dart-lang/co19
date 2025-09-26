// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSFloat32Array get toJS
/// Converts this [Float32List] to a [JSFloat32Array] by either casting,
/// unwrapping, or cloning the [Float32List].
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, all typed lists are the equivalent
/// JavaScript typed arrays, and therefore this getter simply casts.
///
/// When compiling to Wasm, this [Float32List] is a wrapper around a
/// `Float32Array` if it was converted via
/// [JSFloat32ArrayToFloat32List.toDart]. If it is a wrapper, this getter
/// unwraps it and returns the `Float32Array`. If it's instantiated in Dart,
/// this getter clones this [Float32List]'s values into a new
/// [JSFloat32Array].
///
/// Avoid assuming that modifications to this [Float32List] will affect the
/// returned [JSFloat32Array] and vice versa on all compilers unless it was
/// converted first via [JSFloat32ArrayToFloat32List.toDart].
///
/// @description Check that when compiling to JavaScript this operation is a
/// cast and returns the same object. When compiling to Wasm this operation is a
/// wrapping and returns not the same object.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:typed_data';
import '../../../Utils/expect.dart';

main() {
  Float32List l = Float32List.fromList([42]);
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
