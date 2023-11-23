// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a warning to use a null aware operator (?., ?.., ??, ??=,
/// or ...?) on an expression of type T if T is strictly non-nullable.
///
/// @description Check it is a warning to use a null aware operator (?., ?.., ??,
/// ??=, or ...?) on a strictly non-nullable receiver. Test some function type
/// @author sgrekhov@unipro.ru
/// @issue 39598
/// @issue 39714


void foo() {}
void bar() {}
typedef void Foo();

main() {
  Foo a = foo;
  a?.toString();
//^
// [cfe] Operand of null-aware operation '?.' has type 'void Function()' which excludes null.
// ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  a?..toString();
//^
// [cfe] Operand of null-aware operation '?..' has type 'void Function()' which excludes null.
// ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  a ?? bar;
//^
// [cfe] Operand of null-aware operation '??' has type 'void Function()' which excludes null.
//     ^^^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
  a ??= bar;
//^
// [cfe] Operand of null-aware operation '??=' has type 'void Function()' which excludes null.
//      ^^^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
  List<Foo> clist = [foo, bar];
  List<Foo> alist = [foo, bar, ...? clist];
//                             ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                  ^
// [cfe] Operand of null-aware operation '...?' has type 'List<void Function()>' which excludes null.
}
