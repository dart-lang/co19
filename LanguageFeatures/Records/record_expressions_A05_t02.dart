// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record is created using a record expression. The grammar is:
///
/// literal      ::= record
///                | // Existing literal productions...
/// record       ::= 'const'? '(' recordField ( ',' recordField )* ','? ')'
/// recordField  ::= (identifier ':' )? expression
///
/// This is identical to the grammar for a function call argument list. There
/// are a couple of syntactic restrictions not captured by the grammar. It is a
/// compile-time error if a record has any of:
///
/// The same field name more than once.
///
/// Only one positional field and no trailing comma.
///
/// No fields and a trailing comma. The expression (,) isn't allowed.
///
/// A field named hashCode, runtimeType, noSuchMethod, or toString.
///
/// A field name that starts with an underscore.
///
/// A field name that collides with the synthesized getter name of a positional
/// field. For example: ('pos', $1: 'named') since the named field '$1' collides
/// with the getter for the first positional field.
///
/// @description Checks that it is no error if a record has a field name that
/// doesn't collides with the synthesized getter name of a positional field
/// @author sgrekhov22@gmail.com
/// @issue 49883

// SharedOptions=--enable-experiment=records

Record foo() => (42, $101: "Lily was here");

void bar(Record r) {}

main() {
  var record1 = (42, $43: "Lily was here");

  var record2 = (1, 2, 3, $10: 42);

  bar((42, $6: 42));
}
