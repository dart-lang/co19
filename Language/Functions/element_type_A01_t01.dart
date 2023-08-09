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
/// @description Check that if the declared return type of a synchronous
/// generator function `f` is `T`, and `S` is the union-free type derived from
/// `T`, and `S` is of the form `Iterable<U>`, it is a compile-time error to
/// yield an expression whose static type isn't assignable to `U`.
/// @author sgrekhov22@gmail.com

import "dart:async";

Iterable<num?>? f1() sync* {
  yield 1;
  yield 3.14;
  yield null; // Ok, element type is `num?`
}

Iterable<num>? f2() sync* {
  yield 1;
  yield null;
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

FutureOr<Iterable<num>?> f3() sync* {
  yield 1;
  yield null;
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  yield Future<Null>.value(null);
//      ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  yield Future<num>.value(1);
//      ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  f1();
  f2();
  f3();
}
