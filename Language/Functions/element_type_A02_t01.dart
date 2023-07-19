// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the union-free type of a type `T` as follows:
/// If `T` is of the form `S?` or the form `FutureOr<S>` then the union-free
/// type of `T` is the union-free type of `S`. Otherwise, the union-free type
/// of `T` is T.
///
/// We define the element type of a generator function `f` as follows:
/// Let `S` be the union-free type of the declared return type of `f`.
/// ...
/// If `f` is an asynchronous generator and `S` implements `Stream<U>` for some
/// `U` then the element type of `f` is `U`.
///
/// @description Check that element type of an asynchronous generator function
/// `f` is `U`, where `S` is a union-free type of the declared return type of
/// `f` and `S` implements `Stream<U>`
/// @author sgrekhov22@gmail.com

import "dart:async";

Stream<num?>? f1() async* {
  yield 1;
  yield 3.14;
  yield null; // Ok, element type is `num?`
}

Stream<num>? f2() async* {
  yield 1;
  yield null;
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

FutureOr<Stream<num>?> f3() async* {
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
