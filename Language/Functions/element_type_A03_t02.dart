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
/// @description Let `f` be an asynchronous generator function whose declared
/// return type derives a union-free type which is a supertype of `Object`
/// (including `Object` itself). Then check that its element type is `dynamic`.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../Utils/expect.dart";

Object? f1() async* {
  yield 1;
  yield 3.14;
  yield null;
  yield "42";
}

Object f2() async* {
  yield 1;
  yield null;
  yield "42";
}

FutureOr<Object> f3() async* {
  yield 1;
  yield null;
  yield "42";
  yield Future<Null>.value(null);
  yield Future<num>.value(1);
}

FutureOr<Object?>? f4() async* {
  yield 1;
  yield null;
  yield "42";
  yield Future<Null>.value(null);
  yield Future<num>.value(1);
}

FutureOr<void> f5() async* {
  yield 1;
  yield null;
  yield "42";
  yield Future<Null>.value(null);
  yield Future<num>.value(1);
  yield Future<void>.value(1);
  yield Future<void>.value(null);
}

FutureOr<void>? f6() async* {
  yield 1;
  yield null;
  yield "42";
  yield Future<Null>.value(null);
  yield Future<num>.value(1);
  yield Future<void>.value(1);
  yield Future<void>.value(null);
}

main() async {
  dynamic r1 = f1();
  var v1 = await r1.toList();
  Expect.isRuntimeTypeImplementsIterable<dynamic>(v1);

  dynamic r2 = f2();
  var v2 = await r2.toList();
  Expect.isRuntimeTypeImplementsIterable<dynamic>(v2);

  dynamic r3 = f3();
  var v3 = await r3.toList();
  Expect.isRuntimeTypeImplementsIterable<dynamic>(v3);

  dynamic r4 = f4();
  var v4 = await r4.toList();
  Expect.isRuntimeTypeImplementsIterable<dynamic>(v4);

  dynamic r5 = f5();
  var v5 = await r5.toList();
  Expect.isRuntimeTypeImplementsIterable<dynamic>(v5);

  dynamic r6 = f6();
  var v6 = await r6.toList();
  Expect.isRuntimeTypeImplementsIterable<dynamic>(v6);
}
