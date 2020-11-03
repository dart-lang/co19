/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form e! evaluates e to a value v, throws a
 * runtime error if v is null, and otherwise evaluates to v.
 *
 * @description Check that an expression of the form e! evaluates e to a value
 * v, throws no runtime error if v is not null. Test identifier
 * @author sgrekhov@unipro.ru
 * @issue 39723
 * @issue 41193
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class A {
  String s = "Show must go on";
  foo() {}
  Object? get getValue => "Lily was here";
  int? operator [](int index) => index;
  void operator []=(int index, String val) {
    s = val;
  }
}

main() {
  var a = new A() as A?;
  a!;
  a!.foo();
//^
// [cfe] Operand of null-aware operation '!' has type 'A' which excludes null.
// ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  a![42];
//^
// [cfe] Operand of null-aware operation '!' has type 'A' which excludes null.
// ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  a!?.foo();
// [error line 42, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  a!?[42];
// [error line 46, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  a!.s = "Lily was here";
//^
// [cfe] Operand of null-aware operation '!' has type 'A' which excludes null.
// ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  a!?.s = "Let it be";
// [error line 55, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  a![0] = "Lily was here";
//^
// [cfe] Operand of null-aware operation '!' has type 'A' which excludes null.
// ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  a!?[0] = "Lily was here";
// [error line 64, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  if (a != null) {
    a.getValue!;
    a[42]!;
  }
}
