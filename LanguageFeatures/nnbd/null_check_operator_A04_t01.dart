/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form e! evaluates e to a value v, throws a
 * runtime error if v is null, and otherwise evaluates to v.
 *
 * @description Check that expression of the form 'super!' is a compile error
 * @author sgrekhov@unipro.ru
 * @issue 39723
 * @issue 39598
 * @issue 40372
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

class C extends A {
  test() {
    super!;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
    super!.foo();
//       ^
// [analyzer] unspecified
// [cfe] unspecified
    super![42];
//       ^
// [analyzer] unspecified
// [cfe] unspecified
    super!?.foo();
//       ^
// [analyzer] unspecified
// [cfe] unspecified
    super!?[42];
//       ^
// [analyzer] unspecified
// [cfe] unspecified
    super!.s = "Lily was here";
//       ^
// [analyzer] unspecified
// [cfe] unspecified
    super!?.s = "Lily was here";
//       ^
// [analyzer] unspecified
// [cfe] unspecified
    super![0] = "Lily was here";
//       ^
// [analyzer] unspecified
// [cfe] unspecified
    super!?[0] = "Lily was here";
//       ^
// [analyzer] unspecified
// [cfe] unspecified
    super.getValue!;
    super[42]!;
  }
}

main() {
  C c = new C();
  c.test();
}
