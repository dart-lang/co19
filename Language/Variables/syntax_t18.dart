// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that a variable may be abstract void.
/// See https://github.com/dart-lang/language/tree/master/accepted/future-releases/abstract-external-fields
/// @author kaigorodov


abstract class C {
  abstract void x;
}

main() {
  C? c = null;
}
