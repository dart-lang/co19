// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSUint8Array get toJS
/// Converts this [Uint8List] to a [JSUint8Array] by either casting,
/// unwrapping, or cloning the [Uint8List].
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, all typed lists are the equivalent
/// JavaScript typed arrays, and therefore this getter simply casts.
///
/// When compiling to Wasm, this [Uint8List] is a wrapper around a
/// `Uint8Array` if it was converted via [JSUint8ArrayToUint8List.toDart]. If
/// it is a wrapper, this getter unwraps it and returns the `Uint8Array`. If
/// it's instantiated in Dart, this getter clones this [Uint8List]'s values
/// into a new [JSUint8Array].
///
/// Avoid assuming that modifications to this [Uint8List] will affect the
/// returned [JSUint8Array] and vice versa on all compilers unless it was
/// converted first via [JSUint8ArrayToUint8List.toDart].
///
/// @description Check that this operation converts this [Uint8List] to a
/// [JSUint8Array]. Test an array instantiated in Dart.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  Uint8List l1 = Uint8List(0);
  JSUint8Array a1 = l1.toJS;
  globalContext["a1"] = a1;
  eval("globalThis.len1 = globalThis.a1.length;");
  Expect.equals(0, (globalContext["len1"] as JSNumber).toDartInt);
  if (isJS) {
    // Casting case. `toDart` returns the same object.
    Expect.identical(l1, a1.toDart);
  }
  if (isWasm) {
    // The `Uint8List` was instantiated in Dart. This is a cloning case.
    Expect.notIdentical(l1, a1.toDart);
  }

  Uint8List l2 = Uint8List.fromList([1, 2, 33]);
  JSUint8Array a2 = l2.toJS;
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
