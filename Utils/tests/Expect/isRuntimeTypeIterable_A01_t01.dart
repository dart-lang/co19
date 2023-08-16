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

// Requirements=nnbd-strong

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Expect.isRuntimeTypeImplementsIterable<int>(<int>[1, 2, 3]);
  Expect.isRuntimeTypeImplementsIterable<num>(<num>[]);
  Expect.isRuntimeTypeImplementsIterable<Object?>(<Object?>[]);
  FutureOr<List<int>> o = [1, 2, 3];
  Expect.isRuntimeTypeImplementsIterable<int>(o);

  Expect.throws(() {
    Expect.isRuntimeTypeImplementsIterable<num>(<int>[1, 2, 3]);
  }, (e) => e is ExpectException);
  Expect.throws(() {
    Expect.isRuntimeTypeImplementsIterable<num>(<Object>[]);
  }, (e) => e is ExpectException);
  Expect.throws(() {
    Expect.isRuntimeTypeImplementsIterable<double>(<int>[]);
  }, (e) => e is ExpectException);
  Expect.throws(() {
    Expect.isRuntimeTypeImplementsIterable<int>(<num>[1, 2, 3 as num]);
  }, (e) => e is ExpectException);
  Expect.throws(() {
    Expect.isRuntimeTypeImplementsIterable<Object>(<Object?>[]);
  }, (e) => e is ExpectException);
  Expect.throws(() {
    Expect.isRuntimeTypeImplementsIterable<Object?>(<num>[1, 2, 3]);
  });
  Expect.throws(() {
    Expect.isRuntimeTypeImplementsIterable<dynamic>(<int>[1, 2, 3]);
  });
  Expect.throws(() {
    Expect.isRuntimeTypeImplementsIterable<void>(<int>[1, 2, 3]);
  });
  Expect.throws(() {
    Expect.isRuntimeTypeImplementsIterable<Null>(<int>[1, 2, 3]);
  });
  Expect.throws(() {
    Expect.isRuntimeTypeImplementsIterable<Never>(<int>[1, 2, 3]);
  });
}
