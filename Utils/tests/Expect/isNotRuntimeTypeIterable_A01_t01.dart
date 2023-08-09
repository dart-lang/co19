// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion static void isNotRuntimeTypeIterable<T>(Object? it)
/// Failure if `it` is an instance of `Iterable<T>` and all elements have type
/// which is exactly the `T`
///
/// @description Checks no exception is thrown when `it` is not an `Iterable<T>`
/// or not all elements of it have a type `T` (not a subtype). Throws otherwise
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Expect.isNotRuntimeTypeIterable<num>([1, 2, 3]);
  Expect.isNotRuntimeTypeIterable<num>(<int>[]);
  Expect.isNotRuntimeTypeIterable<Object>([]);
  Expect.isNotRuntimeTypeIterable<Object>(Object());
  Expect.isNotRuntimeTypeIterable<Object?>(Object());
  Expect.isNotRuntimeTypeIterable<Object?>([1, 2, 3]);
  Expect.isNotRuntimeTypeIterable<dynamic>([1, 2, 3]);
  Expect.isNotRuntimeTypeIterable<void>([1, 2, 3]);
  Expect.isNotRuntimeTypeIterable<Null>([1, 2, 3]);
  Expect.isNotRuntimeTypeIterable<Never>([1, 2, 3]);

  Future<List<int>> f = Future<List<int>>.value([1, 2, 3]);
  Expect.isNotRuntimeTypeIterable<int>(f);

  FutureOr<List<int>> o1 = [1, 2, 3];
  Expect.isNotRuntimeTypeIterable<num>(o1);

  FutureOr<List<int>> o2 = Future<List<int>>.value([1, 2, 3]);
  Expect.isNotRuntimeTypeIterable<int>(o2);

  Expect.throws(() {
    Expect.isNotRuntimeTypeIterable<num>(<num>[1, 2, 3]);
  }, (e) => e is ExpectException);
  Expect.throws(() {
    FutureOr<List<int>> o = [1, 2, 3];
    Expect.isNotRuntimeTypeIterable<int>(o);
  }, (e) => e is ExpectException);
  Expect.throws(() {
    Expect.isNotRuntimeTypeIterable<num>([1, 2, 3 as num]);
  });
}
