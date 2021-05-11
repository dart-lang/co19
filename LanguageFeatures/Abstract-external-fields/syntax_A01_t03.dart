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


external final int i1, i2;
external final x1, x2;

test() {
  int j = i1;
  int k = i2;
  String s1 = x1;
  String s2 = x2;
}
main() {
}
