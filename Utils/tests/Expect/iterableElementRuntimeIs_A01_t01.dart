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
  Expect.iterableElementsRuntimeIs<int>([1, 2, 3]);
  Expect.iterableElementsRuntimeIs<num>(<int>[]);
  Expect.iterableElementsRuntimeIs<num>(<num>[1, 2, 3]);
  Expect.iterableElementsRuntimeIs<Object?>([]);
  FutureOr<List<int>> o = [1, 2, 3];
  Expect.iterableElementsRuntimeIs<int>(o);

  Expect.throws(() {
    Expect.iterableElementsRuntimeIs<double>(<int>[]);
  }, (e) => e is ExpectException);
  Expect.throws(() {
    Expect.iterableElementsRuntimeIs<num>(<int>[1, 2, 3]);
  }, (e) => e is ExpectException);
  Expect.throws(() {
    Expect.iterableElementsRuntimeIs<int>([1, 2, 3 as num]);
  }, (e) => e is ExpectException);
  Expect.throws(() {
    Expect.iterableElementsRuntimeIs<Object>([]);
  }, (e) => e is ExpectException);
  Expect.throws(() {
    Expect.iterableElementsRuntimeIs<Object?>(<num>[1, 2, 3]);
  });
  Expect.throws(() {
    Expect.iterableElementsRuntimeIs<dynamic>([1, 2, 3]);
  });
  Expect.throws(() {
    Expect.iterableElementsRuntimeIs<void>([1, 2, 3]);
  });
  Expect.throws(() {
    Expect.iterableElementsRuntimeIs<Null>([1, 2, 3]);
  });
  Expect.throws(() {
    Expect.iterableElementsRuntimeIs<Never>([1, 2, 3]);
  });
}
