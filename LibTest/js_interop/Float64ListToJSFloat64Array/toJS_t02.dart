// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSFloat64Array get toJS
/// Converts this [Float64List] to a [JSFloat64Array] by either casting,
/// unwrapping, or cloning the [Float64List].
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, all typed lists are the equivalent
/// JavaScript typed arrays, and therefore this getter simply casts.
///
/// When compiling to Wasm, this [Float64List] is a wrapper around a
/// `Float64Array` if it was converted via
/// [JSFloat64ArrayToFloat64List.toDart]. If it is a wrapper, this getter
/// unwraps it and returns the `Float64Array`. If it's instantiated in Dart,
/// this getter clones this [Float64List]'s values into a new
/// [JSFloat64Array].
///
/// Avoid assuming that modifications to this [Float64List] will affect the
/// returned [JSFloat64Array] and vice versa on all compilers unless it was
/// converted first via [JSFloat64ArrayToFloat64List.toDart].
///
/// @description Check that this operation converts this [Float64List] to a
/// [JSFloat64Array]. Test an array instantiated in JS.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.a = new Float64Array(3);
    globalThis.a[0] = 1;
    globalThis.a[1] = -3.14;
    globalThis.a[3] = 333333.33;
  ''');
  Float64List l = (globalContext["a"] as JSFloat64Array).toDart;
  JSFloat64Array a = l.toJS;
  Expect.listEquals(l.toList(), a.toDart.toList());

  l[2] = 3.14;
  if (isJS) {
    // Casting case. `toDart` returns the same object.
    Expect.identical(l, a.toDart);
  }
  if (isWasm) {
    // The `Float64List` was instantiated in JS. This is a wrapping case.
    // Unwrapping should return the same array.
    var list = a.toDart.toList();
    Expect.equals(1, list[0]);
    Expect.approxEquals(-3.14, list[1]);
    Expect.approxEquals(3.14, list[2]);
  }
}
