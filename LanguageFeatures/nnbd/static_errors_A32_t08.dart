// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a warning to use a null aware operator (?., ?.., ??, ??=,
/// or ...?) on an expression of type T if T is strictly non-nullable.
///
/// @description Check it is a warning to use a null aware operator (?., ?.., ??,
/// ??=, or ...?) on a strictly non-nullable receiver. Test FutureOr<Never>
/// @author sgrekhov@unipro.ru
/// @issue 39598
/// @issue 39714


import "dart:async";

test(FutureOr<Never> t) {
  t?.toString();
//^
// [cfe] Operand of null-aware operation '?.' has type 'FutureOr<Never>' which excludes null.
// ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  t?..toString();
//^
// [cfe] Operand of null-aware operation '?..' has type 'FutureOr<Never>' which excludes null.
// ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  t ?? t;
//^
// [cfe] Operand of null-aware operation '??' has type 'FutureOr<Never>' which excludes null.
//     ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
  t ??= t;
//^
// [cfe] Operand of null-aware operation '??=' has type 'FutureOr<Never>' which excludes null.
//      ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
  List<FutureOr<Never>> clist = [t, t];
  List<FutureOr<Never>> alist = [t, t, ...? clist];
//                                     ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                          ^
// [cfe] Operand of null-aware operation '...?' has type 'List<FutureOr<Never>>' which excludes null.
}

main() {
}
