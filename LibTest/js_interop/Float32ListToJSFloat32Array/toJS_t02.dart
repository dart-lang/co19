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
/// @description Check that this operation converts this [Float32List] to a
/// [JSFloat32Array]. Test an array instantiated in JS.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.a = new Float32Array(3);
    globalThis.a[0] = 1;
    globalThis.a[1] = -3.14;
    globalThis.a[3] = 3333.33;
  ''');
  Float32List l = (globalContext["a"] as JSFloat32Array).toDart;
  JSFloat32Array a = l.toJS;
  Expect.listEquals(l.toList(), a.toDart.toList());

  l[2] = 3.14;
  if (isJS) {
    // Casting case. `toDart` returns the same object.
    Expect.identical(l, a.toDart);
  }
  if (isWasm) {
    // The `Float32List` was instantiated in JS. This is a wrapping case.
    // Unwrapping should return the same array.
    var list = a.toDart.toList();
    Expect.equals(1, list[0]);
    Expect.approxEquals(-3.14, list[1]);
    Expect.approxEquals(3.14, list[2]);
  }
}
