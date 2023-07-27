// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion static void iterableElementsRuntimeIs<T>(dynamic it)
/// Failure if `it` is not instance of `Iterable<T>` or has an element type of
/// which is not exactly the `T`
///
/// @description Checks no exception is thrown when `it` is an `Iterable<T>` and
/// all elements of it have a type `T` (not a subtype)
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {
    Expect.iterableElementsRuntimeIs<Object>(Object());
  }, (e) => e is ExpectException);

  Expect.throws(() {
    Future<List<int>> o = Future.value([1, 2, 3]);
    Expect.iterableElementsRuntimeIs<int>(o);
  }, (e) => e is ExpectException);

  Expect.throws(() {
    FutureOr<List<int>> o = Future.value([1, 2, 3]);
    Expect.iterableElementsRuntimeIs<num>(o);
  }, (e) => e is ExpectException);
}
