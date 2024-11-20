// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For the purposes of errors and warnings, the null aware operators
/// ?., ?.., and ?[] are checked as if the receiver of the operator had
/// non-nullable type. More specifically, if the type of the receiver of a null
/// aware operator is T, then the operator is checked as if the receiver had type
/// NonNull(T).
///
/// @description Check that if the type of the receiver of a null aware operator
/// is T, then the operator is checked as if the receiver had type NonNull(T).
/// Test some type A
/// @issue 38715
/// @issue 39598
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak

class A {
  void test() {}
  int operator[](int index) => 0;
}

main() {
  A a = new A();
  a?.test();
// ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  a ?.. test();
//  ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  a?[0];
// ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
}
