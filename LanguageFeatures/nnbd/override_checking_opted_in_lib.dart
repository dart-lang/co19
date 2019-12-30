/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

library override_opted_in_lib;

import "../../Utils/expect.dart";

class A {
   void test_nullable(int i) {
    Expect.fail("This method should be overriden");
  }

  void test_required({int i = 1}) {
    Expect.fail("This method should be overriden");
  }

   void test_never(Never i) {
      Expect.fail("This method should be overriden");
  }

  int? test_return_nullable() {
    Expect.fail("This method should be overriden");
    return 1;
  }

  Never test_return_never() => throw "Nevermind";

  String field1 = "";
  String? field2 = "";

  String get get_field1 {
    Expect.fail("This method should be overriden");
    return field1;
  }

  String? get get_field2 {
    Expect.fail("This method should be overriden");
    return field2;
  }

  void set set_field1(String str) {
    Expect.fail("This method should be overriden");
  }

  void set set_field2(String? str) {
    Expect.fail("This method should be overriden");
  }
}

class B {
  void test_nullable(int? i) {
    Expect.fail("This method should be overriden");
  }

  void test_required({required int i}) {
    Expect.fail("This method should be overriden");
  }

  int test_return_nullable() {
    Expect.fail("This method should be overriden");
    return 1;
  }
}

class C extends A {
  void test_nullable(int? i) {
    Expect.fail("This method should be overriden");
  }

  void test_required({required int i}) {
    Expect.fail("This method should be overriden");
  }

  void test_never(Null i) {
    Expect.fail("This method should be overriden");
  }

  int test_return_nullable() {
    Expect.fail("This method should be overriden");
    return 3;
  }
}

class D<X extends A> {
  dynamic getParamType() => X;
}

class E<X extends A?> {
  dynamic getParamType() => X;
}
