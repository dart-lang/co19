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
/// A field named hashCode, runtimeType, noSuchMethod, or toString.
///
/// A field name that starts with an underscore.
///
/// A field name that collides with the synthesized getter name of a positional
/// field. For example: ('pos', $0: 'named') since the named field '$0' collides
/// with the getter for the first positional field.
///
/// @description Checks that it is no error if a record has no named fields and
/// only one positional field but with a trailing comma
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

Record foo1() => (1,);

Record foo2() => ((2),);

Record foo3() => ((3,),);

dynamic bar(Record r) => r;

main() {
  var r1 = (1,);
  var r2 = ((2),);
  var r3 = ((3,),);

  Expect.equals(1, r1.$0);
  Expect.equals(2, r2.$0);
  Expect.equals(3, r2.$0.$0);

  Expect.equals(1, foo1().$0);
  Expect.equals(2, foo2().$0);
  Expect.equals((3,), foo3().$0);
  Expect.equals(("Hello",), bar(("Hello",)));
  Expect.equals(("Hello",), bar((("Hello"),)));
}
