// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSArray<T> get toJS
/// Converts this [List] to a [JSArray] by either casting, unwrapping, or
/// cloning the [List].
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
/// > When compiling to JavaScript, the core [List] is a JavaScript `Array`,
/// > and therefore this method simply casts. User-defined [List]s are
/// > currently unsupported when compiling to JavaScript.
/// > When compiling to Wasm, this [List] may or may not be a wrapper
/// > depending on if it was converted from JavaScript or instantiated in
/// > Dart. If it's a wrapper, this method unwraps it. If it's instantiated in
/// > Dart, this method clones this [List]'s values into a new [JSArray].
/// > Avoid assuming that modifications to this [List] will affect the
/// > [JSArray] and vice versa unless it was instantiated in JavaScript.
///
/// @description Check that this method converts this [List] to a [JSArray].
/// Test an array instantiated in JS.
/// @author sgrekhov22@gmail.com
/// @issue 61327

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval("globalThis.a = [1, 2, 3];");
  List<JSNumber> l = (globalContext["a"] as JSArray<JSNumber>).toDart;
  JSArray<JSNumber> a = l.toJS;
  Expect.listEquals(l, a.toDart);

  l.add(4.toJS);
  if (isJS) {
    // Casting case. `toDart` returns the same object.
    Expect.identical(l, a.toDart);
  }
  if (isWasm) {
    // The `List` was instantiated in JS. This is a wrapping case. Unwrapping
    // should return the same array but not the same object.
    Expect.listEquals([1.toJS, 2.toJS, 3.toJS, 4.toJS], a.toDart);
    Expect.notIdentical(l, a.toDart);
  }
}
