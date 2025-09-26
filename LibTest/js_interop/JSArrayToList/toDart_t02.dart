// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion List<T> get toDart
/// Converts this [JSArray] to a [List] by either casting or wrapping it.
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, core [List]s are `Array`s and therefore, if
/// the [JSArray] was already a `List<T>` converted via
/// [ListToJSArray.toJS], this getter simply casts the `Array`. Otherwise, it
/// wraps the `Array` with a [List] that casts the elements to [T] to ensure
/// soundness.
///
/// When compiling to Wasm, the [JSArray] is wrapped with a [List]
/// implementation and the wrapper is returned.
///
/// Modifications to this [JSArray] will affect the returned [List] and vice
/// versa.
///
/// @description Check that this getter converts this [JSArray] to a [List].
/// Test [JSArray] created in Dart.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../../Utils/expect.dart';

main() {
  JSArray<JSNumber> a = JSArray();
  List<JSNumber> l = a.toDart;
  Expect.listEquals([], l);

  a.add(1.toJS);
  Expect.listEquals([1.toJS], l);

  l.removeLast();
  Expect.listEquals([], a.toDart);
}
