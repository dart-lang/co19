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

  int aField = 1;
  int get get_field => aField;
  void set set_field(int i) { aField = i; }
}

class B<X extends A> {}
