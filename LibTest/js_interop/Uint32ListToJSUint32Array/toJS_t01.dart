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
///
/// When compiling to JavaScript, all typed lists are the equivalent
/// JavaScript typed arrays, and therefore this getter simply casts.
///
/// When compiling to Wasm, this [Uint32List] is a wrapper around a
/// `Uint32Array` if it was converted via [JSUint32ArrayToUint32List.toDart].
/// If it is a wrapper, this getter unwraps it and returns the `Uint32Array`.
/// If it's instantiated in Dart, this getter clones this [Uint32List]'s
/// values into a new [JSUint32Array].
///
/// Avoid assuming that modifications to this [Uint32List] will affect the
/// returned [JSUint32Array] and vice versa on all compilers unless it was
/// converted first via [JSUint32ArrayToUint32List.toDart].
///
/// @description Check that this operation converts this [Uint32List] to a
/// [JSUint32Array]. Test an array instantiated in Dart.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  Uint32List l1 = Uint32List(0);
  JSUint32Array a1 = l1.toJS;
  globalContext["a1"] = a1;
  eval("globalThis.len1 = globalThis.a1.length;");
  Expect.equals(0, (globalContext["len1"] as JSNumber).toDartInt);
  if (isJS) {
    // Casting case. `toDart` returns the same object.
    Expect.identical(l1, a1.toDart);
  }
  if (isWasm) {
    // The `Uint32List` was instantiated in Dart. This is a cloning case.
    Expect.notIdentical(l1, a1.toDart);
  }

  Uint32List l2 = Uint32List.fromList([1, 2, 333333]);
  JSUint32Array a2 = l2.toJS;
  Expect.listEquals(l2, a2.toDart.toList());
  l2[2] = 3;
  if (isJS) {
    // Casting case. `toDart` returns the same object.
    Expect.listEquals(l2, a2.toDart.toList());
  }
  if (isWasm) {
    // `a2` was cloned. Changes in `l2` don't affect it.
    Expect.listEquals([1, 2, 333333], a2.toDart.toList());
  }
}
