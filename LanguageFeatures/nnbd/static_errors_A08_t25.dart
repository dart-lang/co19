/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a potentially non-nullable local variable which
 * has no initializer expression and is not marked late is used before it is
 * definitely assigned
 *
 * @description Check that it is not an error if a potentially non-nullable
 * local variable which has no initializer expression but is marked late is used
 * before it is definitely assigned. Test FutureOr<F> where F is a function type
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";
import "dart:async";

typedef void Foo();

class C {
  static void test() {
    late FutureOr<Function> f1;
    late FutureOr<Foo> f2;
    Expect.throws(() {f1.toString();}, (e) => e is LateInitializationError);
    Expect.throws(() {f2.toString();}, (e) => e is LateInitializationError);
  }

  void test2() {
    late FutureOr<Function> f1;
    late FutureOr<Foo> f2;
    Expect.throws(() {f1.toString();}, (e) => e is LateInitializationError);
    Expect.throws(() {f2.toString();}, (e) => e is LateInitializationError);
  }
}

main() {
  late FutureOr<Function> f1;
  late FutureOr<Foo> f2;
  Expect.throws(() {f1.toString();}, (e) => e is LateInitializationError);
  Expect.throws(() {f2.toString();}, (e) => e is LateInitializationError);

  Function foo = () {
    late FutureOr<Function> f1;
    late FutureOr<Foo> f2;
    Expect.throws(() {f1.toString();}, (e) => e is LateInitializationError);
    Expect.throws(() {f2.toString();}, (e) => e is LateInitializationError);
  };
  C.test();
  new C().test2();
  foo();
}
