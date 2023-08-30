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
/// @description Checks that a field declaration may contain the
/// 'abstract' keyword.
/// See https://github.com/dart-lang/language/tree/master/accepted/future-releases/abstract-external-fields
/// @author kaigorodov
/// @issue 42979


abstract class C {
  abstract int x;
}

class D extends C {
  int x = 1;
}

main() {
  new D();
}
