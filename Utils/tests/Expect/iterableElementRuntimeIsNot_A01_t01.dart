// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion static void iterableElementsRuntimeIsNot<T>(dynamic it)
/// Failure if `it` is an instance of `Iterable<T>` and has an element type of
/// which is not exactly the `T`
///
/// @description Checks no exception is thrown when `it` is an `Iterable<T>` and
/// all elements of it have a type `T` (not a subtype)
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Expect.iterableElementsRuntimeIsNot<num>([1, 2, 3]);
  Expect.iterableElementsRuntimeIsNot<num>(<int>[]);
  Expect.iterableElementsRuntimeIsNot<Object>([]);
  Expect.iterableElementsRuntimeIsNot<Object>(Object());
  Expect.iterableElementsRuntimeIsNot<Object?>(Object());
  Expect.iterableElementsRuntimeIsNot<Object?>([1, 2, 3]);
  Expect.iterableElementsRuntimeIsNot<dynamic>([1, 2, 3]);
  Expect.iterableElementsRuntimeIsNot<void>([1, 2, 3]);
  Expect.iterableElementsRuntimeIsNot<Null>([1, 2, 3]);
  Expect.iterableElementsRuntimeIsNot<Never>([1, 2, 3]);

  Future<List<int>> f = Future<List<int>>.value([1, 2, 3]);
  Expect.iterableElementsRuntimeIsNot<int>(f);

  FutureOr<List<int>> o1 = [1, 2, 3];
  Expect.iterableElementsRuntimeIsNot<num>(o1);

  FutureOr<List<int>> o2 = Future<List<int>>.value([1, 2, 3]);
  Expect.iterableElementsRuntimeIsNot<int>(o2);

  Expect.throws(() {
    Expect.iterableElementsRuntimeIsNot<num>(<num>[1, 2, 3]);
  }, (e) => e is ExpectException);
  Expect.throws(() {
    FutureOr<List<int>> o = [1, 2, 3];
    Expect.iterableElementsRuntimeIsNot<int>(o);
  }, (e) => e is ExpectException);
  Expect.throws(() {
    Expect.iterableElementsRuntimeIsNot<num>([1, 2, 3 as num]);
  });
}
