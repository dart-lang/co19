/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class declaration, type alias, or function [G] may be generic,
 * that is, [G] may have formal type parameters declared.
 * @description Checks various correct generic function declarations.
 * @author iarkh@unipro.ru
*/
import "../../Utils/expect.dart";

typedef test_func = Function();

class Test<X> {
  T func1<T>(expected) {
    Expect.equals(expected, T);
  }

  void func2<T extends X>(expected) {
     Expect.equals(expected, T);
  }

  int func3<T extends num>(expected) {
    Expect.equals(expected, T);
  }

  void fManyParameters<
  T0,T1,T2,T3,T4,T5,T6,T7,T8,T9,T10,T11,T12,T13,T14,T15,T16,T17,T18,T19,T20>(){}
}

main() {
  Test test = new Test();

  test.func1(typeOf<dynamic>());
  test.func1<String>(typeOf<String>());
  test.func1<test_func>(typeOf<test_func>());
  test.func1<dynamic>(typeOf<dynamic>());
  test.func1<Null>(typeOf<Null>());

  test.func2(typeOf<dynamic>());

  test.func3(typeOf<num>());
  test.func3<int>(typeOf<int>());
  test.func3<num>(typeOf<num>());

  test.fManyParameters();

  Test<String> test1 = new Test<String>();
  test1.func2(typeOf<String>());

  Test<List> test2 = new Test<List>();
  test2.func2(typeOf<List<dynamic>>());

  Test<test_func> test3 = new Test<test_func>();
  test3.func2(typeOf<test_func>());
}

