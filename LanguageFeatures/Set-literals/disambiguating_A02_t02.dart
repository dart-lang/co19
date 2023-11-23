// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that if s is an emptySetOrMapLiteral with no
/// typeArguments and static context type C, then if S is a subtype of
/// Iterable<Object> and S is not a subtype of Map<Object, Object>, then e is a
/// set literal
/// @issue 36209
/// @author sgrekhov@unipro.ru

class C<T extends Iterable<Object>>  {
  T t = {};
//      ^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'Set<dynamic>' can't be assigned to a variable of type 'T'.
}

main() {
  new C<Set<Object>>();
}
