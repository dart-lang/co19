/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

library override_opted_in_lib;

class A {
  int test_nullable(int i) => 1;
  int test_required({int i = 1}) => 1;
  int test_never(Never i) => 1;

  int? test_return_nullable() => 1;
  Never test_return_never() => throw "Nevermind";

  String field1 = "a";
  String? field2 = "b";

  String get get_field1 => field1;
  String? get get_field2 => field2;

  void set set_field1(String str) { field1 = str; }
  void set set_field2(String? str) { field2 = str; }
}

class B {
  int test_nullable(int? i) => 2;
  int test_required({required int i}) => 2;
  int test_return_nullable() => 2;
}

class C extends A {
  int test_nullable(int? i) => 3;
  int test_required({required int i}) => 3;
  int test_never(Null i) => 3;

  int test_return_nullable() => 3;
}

class D<X extends A> {
  dynamic getParamType() => X;
}

class E<X extends A?> {
  dynamic getParamType() => X;
}
