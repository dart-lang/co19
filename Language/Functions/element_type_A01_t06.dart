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
/// @description Let `f` be a synchronous generator function whose declared
/// return type derives the union-free type `S`, and assume that `S` implements
/// `Iterable<U>`. Then check that the element type of `f` is `U`.
/// @author sgrekhov22@gmail.com
/// @issue 54159

import "dart:async";
import "../../Utils/expect.dart";

FutureOr<Iterable<int?>?> f1() sync* {
  yield 1;
  yield 2;
  yield null;
}

FutureOr<Iterable<int>?>? f2() sync* {
  yield 1;
  yield 2;
  yield 3;
}

main() {
  Expect.isRuntimeTypeImplementsIterable<int?>(f1());
  Expect.isRuntimeTypeImplementsIterable<int>(f2());
}
