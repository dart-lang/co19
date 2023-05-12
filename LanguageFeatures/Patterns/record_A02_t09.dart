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
/// @description Checks record patterns with an Object subpattern in a
/// declaration context
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  var (Square(size: a1),) = (Square(1),);
  Expect.equals(Unit(1), a1);
  var (n: Square(size: a2)) = (n: Square(2));
  Expect.equals(Unit(2), a2);
  var (n: Square(size: a3), Circle(size: b3)) = (n: Square(1), Circle(1));
  Expect.equals(Unit(1), a3);
  Expect.equals(Unit(1), b3);

  final (Square(size: a4),) = (Square(1),);
  Expect.equals(Unit(1), a4);
  final (n: Square(size: a5)) = (n: Square(2));
  Expect.equals(Unit(2), a5);
  final (n: Square(size: a6), Circle(size: b6)) = (n: Square(1), Circle(1));
  Expect.equals(Unit(1), a6);
  Expect.equals(Unit(1), b6);

  var (Square(size: Unit a7),) = (Square(1),);
  Expect.equals(Unit(1), a7);
  var (n: Square(size: Unit a8)) = (n: Square(2));
  Expect.equals(Unit(2), a8);
  var (n: Square(size: Unit a9), Circle(size: Unit b9)) =
    (n: Square(1), Circle(1));
  Expect.equals(Unit(1), a9);
  Expect.equals(Unit(1), b9);
}
