/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author iarkh@unipro.ru
 */
// @ | da | rt=2.4
// SharedOptions=--enable-experiment=non-nullable

library override_legacy_lib;

import "../../Utils/expect.dart";

class A {
  void test_nullable(int i) {
    Expect.fail("This method should be overriden");
  }

  void test_required({int i = 1}) {
    Expect.fail("This method should be overriden");
  }

  void test_never(Null i) {
    Expect.fail("This method should be overriden");
  }

  int test_return_nullable() {
    Expect.fail("This method should be overriden");
    return -1;
  }

  Null test_return_never() {
    Expect.fail("This method should be overriden");
    return null;
  }

  int aField1 = -1;
  int aField2 = null;
  int aField3;

  int get get_field1 {
    Expect.fail("This method should be overriden");
    return -1;
  }

  int get get_field2 {
    Expect.fail("This method should be overriden");
    return -1;
  }

  int get get_field3 {
    Expect.fail("This method should be overriden");
    return -1;
  }

  void set set_field1(int i) {
    Expect.fail("This method should be overriden");
  }

  void set set_field2(int i) {
    Expect.fail("This method should be overriden");
  }

  void set set_field3(int i) {
    Expect.fail("This method should be overriden");
  }
}

class D<X extends A> {}
