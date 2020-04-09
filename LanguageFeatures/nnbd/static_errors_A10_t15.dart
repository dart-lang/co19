/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if an optional parameter (named or otherwise) with
 * no default value has a potentially non-nullable type except in the parameter
 * list of an abstract method declaration.
 *
 * @description Check that it is not an error if an abstract method optional
 * parameter (named or otherwise) with no default value has a potentially
 * non-nullable type
 * @author sgrekhov@unipro.ru
 * @issue 40287
 * @issue 40954
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "legacy_lib.dart";
import "dart:async";

typedef void Foo();

class X {}

abstract class C {
  void test1(var v, [Never n]);
  void test2(var v, {Never n});

  void test3(var v, [Function f]);
  void test4(var v, {Function f});

  void test5(var v, [Foo f]);
  void test6(var v, {Foo f});

  void test7(var v, [X x]);
  void test8(var v, {X x});

  void test9(var v, [A a]);
  void test10(var v, {A a});

  void test11<T extends Object>(var v, [T t]);
  void test12<T extends Object>(var v, {T t});

  void test13<T extends Object?>(var v, [T t]);
  void test14<T extends Object?>(var v, {T t});

  void test15(var v, [FutureOr<Never> n]);
  void test16(var v, {FutureOr<Never> n});

  void test17(var v, [FutureOr<Function> f]);
  void test18(var v, {FutureOr<Function> f});

  void test19(var v, [FutureOr<Foo> f]);
  void test20(var v, {FutureOr<Foo> f});

  void test21(var v, [FutureOr<X> x]);
  void test22(var v, {FutureOr<X> x});

  void test23(var v, [FutureOr<A> a]);
  void test24(var v, {FutureOr<A> a});

  void test25(var v, [FutureOr<FutureOr<X>> x]);
  void test26(var v, {FutureOr<FutureOr<X>> x});

  void test27(var v, [LegacyFoo f]);
  void test28(var v, {LegacyFoo f});
}

main() {
}
