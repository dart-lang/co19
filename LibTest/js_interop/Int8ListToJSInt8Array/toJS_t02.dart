// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSInt8Array get toJS
/// Converts this [Int8List] to a [JSInt8Array] by either casting,
/// unwrapping, or cloning the [Int8List].
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, all typed lists are the equivalent
/// JavaScript typed arrays, and therefore this getter simply casts.
///
/// When compiling to Wasm, this [Int8List] is a wrapper around a `Int8Array`
/// if it was converted via [JSInt8ArrayToInt8List.toDart]. If it is a
/// wrapper, this getter unwraps it and returns the `Int8Array`. If it's
/// instantiated in Dart, this getter clones this [Int8List]'s values into a
/// new [JSInt8Array].
///
/// Avoid assuming that modifications to this [Int8List] will affect the
/// returned [JSInt8Array] and vice versa on all compilers unless it was
/// first converted via [JSInt8ArrayToInt8List.toDart].
///
/// @description Check that this operation converts this [Int8List] to a
/// [JSInt8Array]. Test an array instantiated in JS.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.a = new Int8Array(3);
    globalThis.a[0] = 1;
    globalThis.a[1] = -2;
    globalThis.a[3] = 33;
  ''');
  Int8List l = (globalContext["a"] as JSInt8Array).toDart;
  JSInt8Array a = l.toJS;
  Expect.listEquals(l.toList(), a.toDart.toList());

  l[2] = 3;
  if (isJS) {
    // Casting case. `toDart` returns the same object.
    Expect.identical(l, a.toDart);
  }
  if (isWasm) {
    // The `Int8List` was instantiated in JS. This is a wrapping case.
    // Unwrapping should return the same array.
    Expect.listEquals([1, -2, 3], a.toDart.toList());
  }
}
