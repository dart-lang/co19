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
/// @description Check that when compiling to JavaScript this operation is a
/// cast and returns the same object. When compiling to Wasm this operation is a
/// wrapping and returns not the same object.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:typed_data';
import '../../../Utils/expect.dart';

main() {
  Uint8ClampedList l = Uint8ClampedList.fromList([42]);
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
