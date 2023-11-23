// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a warning to use a null aware operator (?., ?.., ??, ??=,
/// or ...?) on an expression of type T if T is strictly non-nullable.
///
/// @description Check it is a warning to use a null aware operator (?., ?.., ??,
/// ??=, or ...?) on a strictly non-nullable receiver. Test type aliases
/// @author sgrekhov@unipro.ru
/// @issue 39598

// Requirements=nnbd-strong
class A {
  test() {}
}

class C extends A {}

typedef AAlias = A;
typedef CAlias = C;

main() {
  AAlias a = A();
  CAlias c = C();
  a?.test();
// ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//^
// [cfe] Operand of null-aware operation '?.' has type 'A' which excludes null.
  a?..test();
// ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//^
// [cfe] Operand of null-aware operation '?..' has type 'A' which excludes null.

  a ?? c;
//     ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
//^
// [cfe] Operand of null-aware operation '??' has type 'A' which excludes null.
  a ??= c;
//      ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
//^
// [cfe] Operand of null-aware operation '??=' has type 'A' which excludes null.

  List<CAlias> clist = [C(), C()];
  List<A> alist = [A(), C(), ...? clist];
//                           ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                ^
// [cfe] Operand of null-aware operation '...?' has type 'List<C>' which excludes null.
}
