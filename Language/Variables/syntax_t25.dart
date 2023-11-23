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
/// @description Checks that an abstract variable must not initialized
/// See https://github.com/dart-lang/language/tree/master/accepted/future-releases/abstract-external-fields
/// @author sgrekhov@unipro.ru
/// @issue 42981


abstract class C {
  abstract int x = 42;
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  C? c;
}
