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
/// @description Check a run-time type of a return value of a synchronous
/// generator function
/// @author sgrekhov22@gmail.com
/// @issue 54159

import "dart:async";
import "../../Utils/expect.dart";

FutureOr<Iterable<int>?> foo() sync* {
  yield 1;
  yield 2;
  yield 3;
}

main() {
  FutureOr<Iterable<int>?> o = foo() as dynamic;
  o as FutureOr<Iterable<int>>;
  Expect.isRuntimeTypeImplementsIterable<int>(o);
}
