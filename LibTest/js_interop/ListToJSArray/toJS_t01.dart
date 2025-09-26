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
///
/// When compiling to JavaScript, the core [List] is a JavaScript `Array`, and
/// therefore this getter simply casts. If the [List] is not a core [List]
/// e.g. a user-defined list, this getter throws with a cast error.
///
/// When compiling to Wasm, this [List] is a wrapper around an `Array` if it
/// was converted via [JSArrayToList.toDart]. If it's a wrapper, this getter
/// unwraps it and returns the `Array`. If it's instantiated in Dart, this
/// getter clones this [List]'s values into a new [JSArray].
///
/// Avoid assuming that modifications to this [List] will affect the returned
/// [JSArray] and vice versa in all compilers unless it was first converted
/// via [JSArrayToList.toDart].
///
/// @description Check that this method converts this [List] to a [JSArray].
/// Test an array instantiated in Dart.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../../Utils/expect.dart';

main() {
  List<JSString> l1 = List<JSString>.empty();
  JSArray<JSString> a1 = l1.toJS;
  Expect.equals(0, a1.length);
  if (isJS) {
    // Casting case. `toDart` returns the same object.
    Expect.identical(l1, a1.toDart);
  }
  if (isWasm) {
    // The `List` was instantiated in Dart. This is a cloning case.
    Expect.notIdentical(l1, a1.toDart);
  }

  List<JSNumber> l2 = [1.toJS, 2.toJS, 3.toJS];
  JSArray<JSNumber> a2 = l2.toJS;
  Expect.listEquals(l2, a2.toDart);
  l2.add(4.toJS);
  if (isJS) {
    // Casting case. `toDart` returns the same object.
    Expect.listEquals(l2, a2.toDart);
  }
  if (isWasm) {
    // `a2` was cloned. Changes in `l2` don't affect it.
    Expect.listEquals([1.toJS, 2.toJS, 3.toJS], a2.toDart);
  }
}
