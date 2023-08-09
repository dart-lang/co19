// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the union-free type derived from a type T as follows:
/// If T is of the form S? or the form FutureOr<S> then the union-free type
/// derived from T is the union-free type derived from S. Otherwise, the
/// union-free type derived from T is T
///
/// We define the element type of a generator function `f` as follows:
/// Let S be the union-free type derived from the declared return type of f.
/// ...
/// Otherwise, if `f` is a generator (synchronous or asynchronous) and `S` is a
/// supertype of `Object` then the element type of `f` is dynamic
///
/// @description Check that element type of a synchronous generator function `f`
/// is `dynamic`, if `S` is a union-free type of the declared return type of `f`
/// and `S` is a supertype of `Object`
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../Utils/expect.dart";

Object? f1() sync* {
  yield 1;
  yield 3.14;
  yield null;
  yield "42";
}

Object f2() sync* {
  yield 1;
  yield null;
  yield "42";
}

FutureOr<Object> f3() sync* {
  yield 1;
  yield null;
  yield "42";
  yield Future<Null>.value(null);
  yield Future<num>.value(1);
}

FutureOr<Object?>? f4() sync* {
  yield 1;
  yield null;
  yield "42";
  yield Future<Null>.value(null);
  yield Future<num>.value(1);
}

FutureOr<void> f5() sync* {
  yield 1;
  yield null;
  yield "42";
  yield Future<Null>.value(null);
  yield Future<num>.value(1);
  yield Future<void>.value(1);
  yield Future<void>.value(null);
}

FutureOr<void>? f6() sync* {
  yield 1;
  yield null;
  yield "42";
  yield Future<Null>.value(null);
  yield Future<num>.value(1);
  yield Future<void>.value(1);
  yield Future<void>.value(null);
}

main() {
  Expect.isRuntimeTypeIterable<dynamic>(f1());
  Expect.isRuntimeTypeIterable<dynamic>(f2());
  Expect.isRuntimeTypeIterable<dynamic>(f3());
  Expect.isRuntimeTypeIterable<dynamic>(f4());
  Expect.isRuntimeTypeIterable<dynamic>(f5());
  Expect.isRuntimeTypeIterable<dynamic>(f6());
}
