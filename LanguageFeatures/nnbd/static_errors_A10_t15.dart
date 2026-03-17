// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if an optional parameter (named or otherwise) with
/// no default value has a potentially non-nullable type except in the parameter
/// list of an abstract method declaration.
///
/// @description Check that it is not an error if an abstract method optional
/// parameter (named or otherwise) with no default value has a potentially
/// non-nullable type
/// @author sgrekhov@unipro.ru
/// @issue 40287
/// @issue 40954

import "dart:async";

typedef void Foo();

class X {}

abstract class C {
  void test1(int v, [Never n]);
  void test2(int v, {Never n});

  void test3(int v, [Function f]);
  void test4(int v, {Function f});

  void test5(int v, [Foo f]);
  void test6(int v, {Foo f});

  void test7(int v, [X x]);
  void test8(int v, {X x});

  void test11<T extends Object>(int v, [T t]);
  void test12<T extends Object>(int v, {T t});

  void test13<T extends Object?>(int v, [T t]);
  void test14<T extends Object?>(int v, {T t});

  void test15(int v, [FutureOr<Never> n]);
  void test16(int v, {FutureOr<Never> n});

  void test17(int v, [FutureOr<Function> f]);
  void test18(int v, {FutureOr<Function> f});

  void test19(int v, [FutureOr<Foo> f]);
  void test20(int v, {FutureOr<Foo> f});

  void test21(int v, [FutureOr<X> x]);
  void test22(int v, {FutureOr<X> x});

  void test25(int v, [FutureOr<FutureOr<X>> x]);
  void test26(int v, {FutureOr<FutureOr<X>> x});
}

main() {}
