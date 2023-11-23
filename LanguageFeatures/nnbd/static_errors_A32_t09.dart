// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a warning to use a null aware operator (?., ?.., ??, ??=,
/// or ...?) on an expression of type T if T is strictly non-nullable.
///
/// @description Check it is a warning to use a null aware operator (?., ?.., ??,
/// ??=, or ...?) on a strictly non-nullable receiver. Test FutureOr<Function>
/// @author sgrekhov@unipro.ru
/// @issue 39598
/// @issue 39714


import "dart:async";

void foo() {}

main() {
  FutureOr<Function> f = foo;
  f?.toString();
//^
// [cfe] Operand of null-aware operation '?.' has type 'FutureOr<Function>' which excludes null.
// ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  f?..toString();
//^
// [cfe] Operand of null-aware operation '?..' has type 'FutureOr<Function>' which excludes null.
// ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  f ?? f;
//^
// [cfe] Operand of null-aware operation '??' has type 'FutureOr<Function>' which excludes null.
//     ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
  f ??= f;
//^
// [cfe] Operand of null-aware operation '??=' has type 'FutureOr<Function>' which excludes null.
//      ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
  List<FutureOr<Function>> clist = [f, f];
  List<FutureOr<Function>> alist = [f, f, ...? clist];
//                                        ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                             ^
// [cfe] Operand of null-aware operation '...?' has type 'List<FutureOr<Function>>' which excludes null.
}
