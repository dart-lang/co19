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
/// field. For example: ('pos', $0: 'named') since the named field '$0' collides
/// with the getter for the first positional field.
///
/// @description Checks that record fields may contain constructor tear-offs
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

class C {
  int? i;

  C() { i = 0; }

  C.constr1(int i) { this.i = 1; }
}

main() {
  var r = (C.new, c1: C.constr1);
  Expect.equals(0, r.$0().i);
  Expect.equals(1, r.c1(42).i);
}
