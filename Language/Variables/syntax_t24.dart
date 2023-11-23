// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion variableDeclaration:
///     declaredIdentifier (‘, ’ identifier)*
///   ;
///   declaredIdentifier:
///     metadata finalConstVarOrType identifier
///   ;
///   finalConstVarOrType:
///     final type? |
///     const type? |
///     varOrType
///   ;
///   varOrType:
///     var |
///     type
///   ;
///   initializedVariableDeclaration:
///     declaredIdentifier (‘=’ expression)? (‘, ’ initializedIdentifier)*
///   ;
///   initializedIdentifier:
///     identifier (‘=’ expression)?
///   ;
///   initializedIdentifierList:
///     initializedIdentifier (‘, ’ initializedIdentifier)*
///   ;
/// @description Checks that an abstract variable must be in an abstract class
/// See https://github.com/dart-lang/language/tree/master/accepted/future-releases/abstract-external-fields
/// @author sgrekhov@unipro.ru
/// @issue 42980


class C {
//    ^
// [cfe] unspecified
  abstract int? x;
//^
// [analyzer] unspecified
}

main() {
  new C();
}
