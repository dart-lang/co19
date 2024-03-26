// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An expression of the form e! evaluates e to a value v, throws a
/// runtime error if v is null, and otherwise evaluates to v.
///
/// @description Check that an expression of the form e! evaluates e to a value
/// v, throws no runtime error if v is not null. Test 'this'
/// @author sgrekhov@unipro.ru
/// @issue 39723
/// @issue 39598
/// @issue 41193


class A {
  String s = "Show must go on";
  foo() {}
  Object? get getValue => "Lily was here";
  int? operator [](int index) => index;
  void operator []=(int index, String val) {
    s = val;
  }

  test() {
    this!;
//      ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
    this!.foo();
//      ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
    this![42];
//      ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
    this!?.foo();
//      ^^^
// [analyzer] unspecified
    this!?[42];
//      ^^
// [analyzer] unspecified
    this!.s = "Lily was here";
//      ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
    this!?.s = "Lily was here";
//      ^^^
// [analyzer] unspecified
    this![0] = "Lily was here";
//      ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
    this!?[0] = "Lily was here";
//      ^^^
// [analyzer] unspecified
    this.getValue!;
    this[42]!;
  }
}

main() {
  A a = new A();
  a.test();
}
