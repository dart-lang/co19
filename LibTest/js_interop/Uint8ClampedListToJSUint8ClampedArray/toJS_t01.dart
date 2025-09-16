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
/// [JSUint8ClampedArray]. Test an array instantiated in Dart.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  Uint8ClampedList l1 = Uint8ClampedList(0);
  JSUint8ClampedArray a1 = l1.toJS;
  globalContext["a1"] = a1;
  eval("globalThis.len1 = globalThis.a1.length;");
  Expect.equals(0, (globalContext["len1"] as JSNumber).toDartInt);
  if (isJS) {
    // Casting case. `toDart` returns the same object.
    Expect.identical(l1, a1.toDart);
  }
  if (isWasm) {
    // The `Uint8ClampedList` was instantiated in Dart. This is a cloning case.
    Expect.notIdentical(l1, a1.toDart);
  }

  Uint8ClampedList l2 = Uint8ClampedList.fromList([1, 2, 33]);
  JSUint8ClampedArray a2 = l2.toJS;
  Expect.listEquals(l2, a2.toDart.toList());
  l2[2] = 3;
  if (isJS) {
    // Casting case. `toDart` returns the same object.
    Expect.listEquals(l2, a2.toDart.toList());
  }
  if (isWasm) {
    // `a2` was cloned. Changes in `l2` don't affect it.
    Expect.listEquals([1, 2, 33], a2.toDart.toList());
  }
}
