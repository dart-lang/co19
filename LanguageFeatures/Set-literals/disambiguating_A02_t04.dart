// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let e be a setOrMapLiteral.
/// If e has a context C, and the base type of C is Cbase (that is, Cbase is C
/// with all wrapping FutureOrs removed), and Cbase is not ?, then let S be the
/// greatest closure.
/// ...
/// if S is defined and is a subtype of Iterable<Object> and S is not a subtype
/// of Map<Object, Object>, then e is a set literal.
///
/// @description Checks that if C is some subclass of Set<X>, then the literal is
/// a set literal, but it is also a guaranteed type error even if the literal is
/// a set but a wrong type
/// @author sgrekhov@unipro.ru

import "dart:collection";

main() {
  SplayTreeSet s1 = {};
//                  ^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'Set<dynamic>' can't be assigned to a variable of type 'SplayTreeSet<dynamic>'.
  SplayTreeSet<int> s2 = {};
//                       ^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'Set<dynamic>' can't be assigned to a variable of type 'SplayTreeSet<int>'.
  SplayTreeSet<int> s3 = <int>{};
//                       ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
//                          ^
// [cfe] A value of type 'Set<int>' can't be assigned to a variable of type 'SplayTreeSet<int>'.
}
