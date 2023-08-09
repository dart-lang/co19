// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the union-free type derived from a type T as follows:
/// If T is of the form S? or the form FutureOr<S> then the union-free type
/// derived from T is the union-free type derived from S. Otherwise, the
/// union-free type derived from T is T
///
/// We define the element type of a generator function `f` as follows:
/// Let S be the union-free type derived from the declared return type of f. If
/// f is a synchronous generator and S implements Iterable<U> for some U then
/// the element type of f is U.
///
/// @description Check that runtime type of an element type of a synchronous
/// generator function `f` is `U`, where `S` is a union-free type of the
/// declared return type of `f` and `S` implements `Iterable<U>`. Test the
/// run-time types of objects returned by a synchronous generator function
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

Iterable<int?>? f1() sync* {
  yield 1;
  yield 2;
  yield null;
}

Iterable<int>? f2() sync* {
  yield 1;
  yield 2;
  yield 3;
}

main() {
  Expect.isNotRuntimeTypeIterable<num?>(f1());
  Expect.isNotRuntimeTypeIterable<int>(f1());
  Expect.isNotRuntimeTypeIterable<Object>(f1());
  Expect.isNotRuntimeTypeIterable<Object?>(f1());
  Expect.isNotRuntimeTypeIterable<dynamic>(f1());
  Expect.isRuntimeTypeIterable<int?>(f1());

  Expect.isNotRuntimeTypeIterable<num?>(f2());
  Expect.isNotRuntimeTypeIterable<num>(f2());
  Expect.isNotRuntimeTypeIterable<int?>(f2());
  Expect.isNotRuntimeTypeIterable<Object>(f2());
  Expect.isNotRuntimeTypeIterable<Object?>(f2());
  Expect.isNotRuntimeTypeIterable<dynamic>(f2());
  Expect.isRuntimeTypeIterable<int>(f2());
}
