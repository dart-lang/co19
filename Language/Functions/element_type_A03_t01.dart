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
/// Otherwise, if `f` is a generator (synchronous or asynchronous) and `S` is a
/// supertype of `Object` then the element type of `f` is dynamic
///
/// @description Check that element type of a synchronous generator function `f`
/// is `dynamic`, if `S` is a union-free type of the declared return type of `f`
/// and `S` is a supertype of `Object`
/// @author sgrekhov22@gmail.com

import "dart:async";

Object? f1() sync* {
  yield 1;
  yield 3.14;
  yield null;
  yield "42";
}

Object f2() sync* {
  yield 1;
  yield null;
}

FutureOr<Object> f3() sync* {
  yield 1;
  yield null;
  yield Future<Null>.value(null);
  yield Future<num>.value(1);
}

FutureOr<Object?>? f4() sync* {
  yield 1;
  yield null;
  yield Future<Null>.value(null);
  yield Future<num>.value(1);
}

main() {
  f1();
  f2();
  f3();
  f4();
}
