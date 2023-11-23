// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let e be a setOrMapLiteral.
/// If e has a context C, and the base type of C is Cbase (that is, Cbase is C
/// with all wrapping FutureOrs removed), and Cbase is not ?, then let S be the
/// greatest closure.
/// ...
/// If leaf elements has at least one mapEntry and at least one
/// expressionElement, report a compile-time error.
///
/// @description Checks that it is a compile-time error if leaf elements has at
/// least one mapEntry and at least one expressionElement
/// @author sgrekhov@unipro.ru

main() {
  int x = 1;
  var c1 = {if (2 > 1) x: x + 1, if (1 < 2) x};
//         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.AMBIGUOUS_SET_OR_MAP_LITERAL_BOTH
//          ^
// [cfe] Expected ',' before this.
  var c2 = {if (2 > 1) "s": "s" else "$x"};
//         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.AMBIGUOUS_SET_OR_MAP_LITERAL_EITHER
//                                       ^
// [cfe] Expected ':' after this.
  var c3 = {if (2 > 1) "s" else "$x": "x", if (2 > 1) x: x};
//                     ^^^
// [analyzer] COMPILE_TIME_ERROR.EXPRESSION_IN_MAP
// [cfe] Expected ':' after this.
  var c4 = {for (var i = 0; i < 3; i++) if (2 > 1) "s": "s" else if (2 > 1) x};
//         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.AMBIGUOUS_SET_OR_MAP_LITERAL_EITHER
//                                                               ^
// [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
  var c5 = {for (var i in [1, 2, 3]) if (1 > 2) x else if (2 > 1) i: i};
//         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.AMBIGUOUS_SET_OR_MAP_LITERAL_EITHER
//                                              ^
// [cfe] Expected ':' after this.
  var c6 = {if (1 > 2) for (var i in [1, 2, 3]) i else if (2 > 1) for (var i = 0; i < 3; i++) i: i};
//         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.AMBIGUOUS_SET_OR_MAP_LITERAL_EITHER
//                     ^
// [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
  var c7 = {if (2 > 1) for (var i in [1, 2, 3]) i:i else if (2 > 1) for (var i = 0; i < 3; i++) i};
//         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.AMBIGUOUS_SET_OR_MAP_LITERAL_EITHER
//                                                       ^
// [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
}
