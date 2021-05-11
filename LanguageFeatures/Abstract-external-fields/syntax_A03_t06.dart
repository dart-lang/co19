// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The grammar is modified as follows:
///
/// <topLevelDefinition> ::=
///  ... |
///  // New alternative.
///  'external' <finalVarOrType> <identifierList> ';'
///
///  <finalVarOrType> ::= // New rule.
///  'final' <type>? |
///  <varOrType>
///
///  <declaration> ::=
///  ... |
///  // New alternative.
///  'external' ('static'? <finalVarOrType> | 'covariant' <varOrType>)
///  <identifierList> |
/// // New alternative.
///  'abstract' (<finalVarOrType> | 'covariant' <varOrType>) <identifierList>
///
/// @description Checks topLevelDefinition syntax
/// @author sgrekhov@unipro.ru

abstract class C {
  static abstract num? i1;
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  abstract static var i2;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  C? c;
}
