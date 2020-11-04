/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a warning to use a null aware operator (?., ?.., ??, ??=,
 * or ...?) on an expression of type T if T is strictly non-nullable.
 *
 * @description Check it is a warning to use a null aware operator (?., ?.., ??,
 * ??=, or ...?) on a strictly non-nullable receiver. Test FutureOr<FutureOr<A>>
 * @author sgrekhov@unipro.ru
 * @issue 39598
 * @issue 39714
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "dart:async";

class A {}

main() {
  FutureOr<FutureOr<A>> a = new A();
  a?.toString();
//^
// [cfe] Operand of null-aware operation '?.' has type 'FutureOr<FutureOr<A>>' which excludes null.
// ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  a?..toString();
//^
// [cfe] Operand of null-aware operation '?..' has type 'FutureOr<FutureOr<A>>' which excludes null.
// ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  a ?? a;
//^
// [cfe] Operand of null-aware operation '??' has type 'FutureOr<FutureOr<A>>' which excludes null.
//     ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
  a ??= a;
//^
// [cfe] Operand of null-aware operation '??=' has type 'FutureOr<FutureOr<A>>' which excludes null.
//      ^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
  List<FutureOr<FutureOr<A>>> clist = [a, a];
  List<FutureOr<FutureOr<A>>> alist = [a, a, ...? clist];
  //                                         ^^^^
  // [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  //                                              ^
  // [cfe] Operand of null-aware operation '...?' has type 'List<FutureOr<FutureOr<A>>>' which excludes null.
}
