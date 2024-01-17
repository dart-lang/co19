// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The cast expression ensures that an object is a member of a type.
/// ⟨typeCast⟩ ::= ⟨asOperator⟩ ⟨typeNotVoid⟩
/// ⟨asOperator⟩ ::= as
///
/// @description Checks that it is a compile-time error when the second argument
/// of a type cast operator is a type `void`.
/// @author sgrekhov22@gmail.com

main() {
  var v1 = 1 as void;
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
