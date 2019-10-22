/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author iarkh@unipro.ru
 */
// @dart=2.4
// SharedOptions=--enable-experiment=non-nullable

library override_legacy_lib;

class A {
  int test_nullable(int i) => 1;
  int test_required({int i = 1}) => 1;
  int test_never(Null i) => 1;

  int test_return_nullable() => 1;
  Null test_return_never() => null;

  int aField1 = 1;
  int aField2 = null;
  int aField3;
  int get get_field1 => -1;
  int get get_field2 => -2;
  int get get_field3 => -3;
  void set set_field1(int i) { aField1 = -1; }
  void set set_field2(int i) { aField1 = -2; }
  void set set_field3(int i) { aField1 = -3; }
}

class B<X extends A> {}
