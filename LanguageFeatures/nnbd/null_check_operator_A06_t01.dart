// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An expression of the form e! evaluates e to a value v, throws a
/// runtime error if v is null, and otherwise evaluates to v.
///
/// @description Check that an expression of the form e! evaluates e to a value
/// v, throws a runtime error if v is null. Test constructor
/// @author sgrekhov@unipro.ru
/// @issue 39723
/// @issue 39724
/// @issue 41193

// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class A {
  String s = "Show must go on";
  foo() {}
  Object? get getValue => "Lily was here";
  Object? get getNull => null;
  int? operator [](int? index) => index;
  void operator []=(int index, String val) {
    s = val;
  }
}

main() {
  new A()!;
//       ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  new A()!.foo();
//       ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  new A()![42];
//       ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  new A()!?.foo();
//       ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
//        ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  new A()!?[42];
//       ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
//        ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  new A().getValue!;
  new A()[42]!;
  new A()!.s = "Lily was here";
//       ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  new A()!?.s = "Lily was here";
//       ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
//        ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  new A()![0] = "Lily was here";
//       ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  new A()!?[0] = "Lily was here";
//       ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
//        ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.throws(() {new A().getNull!;});
  Expect.throws(() {new A()[null]!;});
}
