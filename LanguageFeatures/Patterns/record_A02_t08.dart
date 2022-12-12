// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// recordPattern         ::= '(' patternFields? ')'
/// patternFields         ::= patternField ( ',' patternField )* ','?
/// patternField          ::= ( identifier? ':' )? pattern
///
/// A record pattern matches a record object and destructures its fields. If the
/// value isn't a record with the same shape as the pattern, then the match
/// fails. Otherwise, the field subpatterns are matched against the
/// corresponding fields in the record.
///
/// Field subpatterns can be in one of three forms:
///
/// A bare `pattern` destructures the corresponding positional field from the
/// record and matches it against pattern.
///
/// An `identifier: pattern` destructures the named field with the name
/// identifier and matches it against pattern.
///
/// A `: pattern` is a named field with the name omitted. When destructuring
/// named fields, it's very common to want to bind the resulting value to a
/// variable with the same name.
///
/// As a convenience, the identifier can be omitted and inferred from pattern.
/// The subpattern must be a variable pattern which may be wrapped in a unary
/// pattern. The field name is then inferred from the name in the variable
/// pattern.
///
/// @description Checks record patterns with a record subpattern in a
/// declaration context
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";

main() {
  var ((a1,),) = ((-1,),);
  Expect.equals(-1, a1);
  var (n: (x: a2)) = (n: (x: 42));
  Expect.equals(42, a2);
  var (n: (x: a3, b3), (y: c3, d3)) = (n: (x: 42, -1), (y: 1, 0));
  Expect.equals(42, a3);
  Expect.equals(-1, b3);
  Expect.equals(1, c3);
  Expect.equals(0, d3);

  final ((a4,),) = ((-1,),);
  Expect.equals(-1, a4);
  final (n: ((x: a5)) = (n: (x: 42));
  Expect.equals(42, a5);
  final (n: (x: a6, b6), (y: c6, d6)) = (n: (x: 42, -1), (y: 1, 0));
  Expect.equals(42, a6);
  Expect.equals(-1, b6);
  Expect.equals(1, c6);
  Expect.equals(0, d6);

  var ((int,) (a7,),) = ((-1,),);
  Expect.equals(-1, a7);
  var (n: ({int x}) (x: a8)) = (n: (x: 42));
  Expect.equals(42, a8);
  var (n: (int, {int x}) (x: a9, b9), (int z, {int y}) (y: c9, d9))
    = (n: (x: 42, -1), (y: 1, 0));
  Expect.equals(42, a9);
  Expect.equals(-1, b9);
  Expect.equals(1, c9);
  Expect.equals(0, d9);
}
