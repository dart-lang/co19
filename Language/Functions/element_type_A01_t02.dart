// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the union-free type of a type `T` as follows:
/// If `T` is of the form `S?` or the form `FutureOr<S>` then the union-free
/// type of `T` is the union-free type of `S`. Otherwise, the union-free type
/// of `T` is T.
///
/// We define the element type of a generator function `f` as follows:
/// Let `S` be the union-free type of the declared return type of `f`. If `f` is
/// a synchronous generator and `S` implements `Iterable<U>` for some `U` then
/// the element type of `f` is `U`.
///
/// @description Check that it is a compile-time error if an element type of a
/// synchronous generator function `f` is not `U`, where `S` is a union-free
/// type of the declared return type of `f` and `S` implements `Iterable<U>`
/// @author sgrekhov22@gmail.com

import "dart:async";

Iterable<int>? f1() sync* {
  yield 1;
  yield 3.14;
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  yield "2";
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

FutureOr<Iterable<int>?> f2() sync* {
  yield 1;
  yield 3.14;
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  yield "2";
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  f1();
  f2();
}
