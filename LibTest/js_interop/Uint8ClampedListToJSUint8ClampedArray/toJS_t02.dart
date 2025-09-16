// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSUint8ClampedArray get toJS
/// Converts this [Uint8ClampedList] to a [JSUint8ClampedArray] by either
/// casting, unwrapping, or cloning the [Uint8ClampedList].
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
/// > When compiling to JavaScript, all typed lists are the equivalent
/// > JavaScript typed arrays, and therefore this method simply casts.
/// > When compiling to Wasm, this [Uint8ClampedList] may or may not be a
/// > wrapper depending on if it was converted from JavaScript or instantiated
/// > in Dart. If it's a wrapper, this method unwraps it. If it's instantiated
/// > in Dart, this method clones this [Uint8ClampedList]'s values into a new
/// > [JSUint8ClampedArray].
/// > Avoid assuming that modifications to this [Uint8ClampedList] will affect
/// > the [JSUint8ClampedArray] and vice versa unless it was instantiated in
/// > JavaScript.
///
/// @description Check that this operation converts this [Uint8ClampedList] to a
/// [JSUint8ClampedArray]. Test an array instantiated in JS.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.a = new Uint8ClampedArray(3);
    globalThis.a[0] = 1;
    globalThis.a[1] = 2;
    globalThis.a[3] = 33;
  ''');
  Uint8ClampedList l = (globalContext["a"] as JSUint8ClampedArray).toDart;
  JSUint8ClampedArray a = l.toJS;
  Expect.listEquals(l.toList(), a.toDart.toList());

  l[2] = 3;
  if (isJS) {
    // Casting case. `toDart` returns the same object.
    Expect.identical(l, a.toDart);
  }
  if (isWasm) {
    // The `Uint8ClampedList` was instantiated in JS. This is a wrapping case.
    // Unwrapping should return the same array but not the same object.
    Expect.listEquals([1, 2, 3], a.toDart.toList());
    Expect.notIdentical(l, a.toDart);
  }
}
