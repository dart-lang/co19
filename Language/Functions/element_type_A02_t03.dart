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
/// @description Check a run-time type of a returned value of an asynchronous
/// generator function
/// @author sgrekhov22@gmail.com

import "dart:async";

FutureOr<Stream<int>?> foo() async* {
  yield 1;
  yield 2;
  yield 3;
}

main() async {
  dynamic d = await foo();
  FutureOr<Stream<int>?> o = d;
  o as FutureOr<Stream<int>?>;
}
