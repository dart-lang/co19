// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion static void isRuntimeTypeIterable<T>(Object? it)
/// Failure if `it` is not instance of `Iterable<T>` or has an element type of
/// which is not exactly the `T`
///
/// @description Checks no exception is thrown when `it` is an `Iterable<T>` and
/// all elements of it have a type `T` (not a subtype). Throws otherwise.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Expect.isRuntimeTypeIterable<int>([1, 2, 3]);
  Expect.isRuntimeTypeIterable<num>(<num>[]);
  Expect.isRuntimeTypeIterable<Object?>([]);
  FutureOr<List<int>> o = [1, 2, 3];
  Expect.isRuntimeTypeIterable<int>(o);

  Expect.throws(() {
    Expect.isRuntimeTypeIterable<num>(<int>[1, 2, 3]);
  }, (e) => e is ExpectException);
  Expect.throws(() {
    Expect.isRuntimeTypeIterable<num>(<Object>[]);
  }, (e) => e is ExpectException);
  Expect.throws(() {
    Expect.isRuntimeTypeIterable<double>(<int>[]);
  }, (e) => e is ExpectException);
  Expect.throws(() {
    Expect.isRuntimeTypeIterable<int>([1, 2, 3 as num]);
  }, (e) => e is ExpectException);
  Expect.throws(() {
    Expect.isRuntimeTypeIterable<Object>([]);
  }, (e) => e is ExpectException);
  Expect.throws(() {
    Expect.isRuntimeTypeIterable<Object?>(<num>[1, 2, 3]);
  });
  Expect.throws(() {
    Expect.isRuntimeTypeIterable<dynamic>([1, 2, 3]);
  });
  Expect.throws(() {
    Expect.isRuntimeTypeIterable<void>([1, 2, 3]);
  });
  Expect.throws(() {
    Expect.isRuntimeTypeIterable<Null>([1, 2, 3]);
  });
  Expect.throws(() {
    Expect.isRuntimeTypeIterable<Never>([1, 2, 3]);
  });
}
