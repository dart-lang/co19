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
/// > When compiling to JavaScript, all typed lists are the equivalent
/// > JavaScript typed arrays, and therefore this method simply casts.
/// > When compiling to Wasm, this [Float64List] may or may not be a wrapper
/// > depending on if it was converted from JavaScript or instantiated in
/// > Dart. If it's a wrapper, this method unwraps it. If it's instantiated in
/// > Dart, this method clones this [Float64List]'s values into a new
/// > [JSFloat64Array].
/// > Avoid assuming that modifications to this [Float64List] will affect the
/// > [JSFloat64Array] and vice versa unless it was instantiated in
/// > JavaScript.
///
/// @description Check that this operation converts this [Float64List] to a
/// [JSFloat64Array]. Test an array instantiated in Dart.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  Float64List l1 = Float64List(0);
  JSFloat64Array a1 = l1.toJS;
  globalContext["a1"] = a1;
  eval("globalThis.len1 = globalThis.a1.length;");
  Expect.equals(0, (globalContext["len1"] as JSNumber).toDartInt);
  if (isJS) {
    // Casting case. `toDart` returns the same object.
    Expect.identical(l1, a1.toDart);
  }
  if (isWasm) {
    // The `Float64List` was instantiated in Dart. This is a cloning case.
    Expect.notIdentical(l1, a1.toDart);
  }

  Float64List l2 = Float64List.fromList([1, -3.14, 333333.33]);
  JSFloat64Array a2 = l2.toJS;
  Expect.listEquals(l2, a2.toDart.toList());
  l2[2] = 3.14;
  if (isJS) {
    // Casting case. `toDart` returns the same object.
    Expect.listEquals(l2, a2.toDart.toList());
  }
  if (isWasm) {
    // `a2` was cloned. Changes in `l2` don't affect it.
    var list = a2.toDart.toList();
    Expect.equals(1, list[0]);
    Expect.approxEquals(-3.14, list[1]);
    Expect.approxEquals(333333.33, list[2]);
  }
}
