// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSUint32Array get toJS
/// Converts this [Uint32List] to a [JSUint32Array] by either casting,
/// unwrapping, or cloning the [Uint32List].
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
/// > When compiling to JavaScript, all typed lists are the equivalent
/// > JavaScript typed arrays, and therefore this method simply casts.
/// > When compiling to Wasm, this [Uint32List] may or may not be a wrapper
/// > depending on if it was converted from JavaScript or instantiated in
/// > Dart. If it's a wrapper, this method unwraps it. If it's instantiated in
/// > Dart, this method clones this [Uint32List]'s values into a new
/// > [JSUint32Array].
/// > Avoid assuming that modifications to this [Uint32List] will affect the
/// > [JSUint32Array] and vice versa unless it was instantiated in JavaScript.
///
/// @description Check that this operation converts this [Uint32List] to a
/// [JSUint32Array]. Test an array instantiated in JS.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.a = new Uint32Array(3);
    globalThis.a[0] = 1;
    globalThis.a[1] = 2;
    globalThis.a[3] = 333333;
  ''');
  Uint32List l = (globalContext["a"] as JSUint32Array).toDart;
  JSUint32Array a = l.toJS;
  Expect.listEquals(l.toList(), a.toDart.toList());

  l[2] = 3;
  if (isJS) {
    // Casting case. `toDart` returns the same object.
    Expect.identical(l, a.toDart);
  }
  if (isWasm) {
    // The `Uint32List` was instantiated in JS. This is a wrapping case.
    // Unwrapping should return the same array.
    Expect.listEquals([1, 2, 3], a.toDart.toList());
  }
}
