// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The cast expression ensures that an object is a member of a type.
/// ⟨typeCast⟩ ::= ⟨asOperator⟩ ⟨typeNotVoid⟩
/// ⟨asOperator⟩ ::= as
///
/// @description Checks that it is a compile-time error when the second argument
/// of a type cast operator is a function expression rather than a type.
/// @author rodionov

main() {
  (int x) => 1 as (num x) => 2;
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
}
