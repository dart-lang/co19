// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The cast expression ensures that an object is a member of a type.
/// ⟨typeCast⟩ ::= ⟨asOperator⟩ ⟨typeNotVoid⟩
/// ⟨asOperator⟩ ::= as
///
/// @description Checks that it is a compile-time error when the type cast
/// operator is missing the first argument.
/// @author rodionov

main() {
  var x = (as int);
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}
