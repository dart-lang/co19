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
/// Test Function
/// @issue 38715
/// @issue 39598
/// Language @issue https://github.com/dart-lang/language/issues/711
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak
typedef void Foo();

void foo() {}

main() {
  Function f1 = foo;
  f1?.toString();
//  ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//^
// [cfe] Operand of null-aware operation '?.' has type 'Function' which excludes null.
  f1 ?.. toString();
//   ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//^
// [cfe] Operand of null-aware operation '?..' has type 'Function' which excludes null.

  Foo f2 = foo;
  f2?.toString();
//  ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//^
// [cfe] Operand of null-aware operation '?.' has type 'void Function()' which excludes null.
  f2 ?.. toString();
//   ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//^
// [cfe] Operand of null-aware operation '?..' has type 'void Function()' which excludes null.
}


