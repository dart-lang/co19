// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSInt16Array get toJS
/// Converts this [Int16List] to a [JSInt16Array] by either casting,
/// unwrapping, or cloning the [Int16List].
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
/// > When compiling to JavaScript, all typed lists are the equivalent
/// > JavaScript typed arrays, and therefore this method simply casts.
/// > When compiling to Wasm, this [Int16List] may or may not be a wrapper
/// > depending on if it was converted from JavaScript or instantiated in
/// > Dart. If it's a wrapper, this method unwraps it. If it's instantiated in
/// > Dart, this method clones this [Int16List]'s values into a new
/// > [JSInt16Array].
/// > Avoid assuming that modifications to this [Int16List] will affect the
/// > [JSInt16Array] and vice versa unless it was instantiated in JavaScript.
///
/// @description Check that this operation converts this [Int16List] to a
/// [JSInt16Array]. Test an array instantiated in Dart.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  Int16List l1 = Int16List(0);
  JSInt16Array a1 = l1.toJS;
  globalContext["a1"] = a1;
  eval("globalThis.len1 = globalThis.a1.length;");
  Expect.equals(0, (globalContext["len1"] as JSNumber).toDartInt);
  if (isJS) {
    // Casting case. `toDart` returns the same object.
    Expect.identical(l1, a1.toDart);
  }
  if (isWasm) {
    // The `Int16List` was instantiated in Dart. This is a cloning case.
    Expect.notIdentical(l1, a1.toDart);
  }

  Int16List l2 = Int16List.fromList([1, -2, 333]);
  JSInt16Array a2 = l2.toJS;
  Expect.listEquals(l2, a2.toDart.toList());
  l2[2] = 3;
  if (isJS) {
    // Casting case. `toDart` returns the same object.
    Expect.listEquals(l2, a2.toDart.toList());
  }
  if (isWasm) {
    // `a2` was cloned. Changes in `l2` don't affect it.
    Expect.listEquals([1, -2, 333], a2.toDart.toList());
  }
}
