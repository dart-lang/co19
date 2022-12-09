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
/// @description Checks record patterns with cast subpattern in a declaration
/// context
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  var (a1 as num,) = (-1,);
  Expect.equals(-1, a1);
  a1 = 3.14;
  var (n: a2 as num) = (n: 42);
  Expect.equals(42, a2);
  a2 = 3.14;
  var (n: a3 as num, b3 as num) = (n: 42, -1);
  Expect.equals(42, a3);
  Expect.equals(-1, b3);
  a3 = 3.14;
  b3 = 3.14;
  var (:n1 as num) = (n1: 42);
  Expect.equals(42, n1);
  n1 = 3.14;

  final (a4 as num,) = (-1,);
  Expect.equals(-1, a4);
  final (n: a5 as num) = (n: 42);
  Expect.equals(42, a5);
  final (n: a6 as num, b6 as num) = (n: 42, -1);
  Expect.equals(42, a6);
  Expect.equals(-1, b6);
  final (:n2 as num) = (n2: 42);
  Expect.equals(42, n2);

  var (num a7 as int,) = (-1,);
  Expect.equals(-1, a7);
  var (n: num a8 as int) = (n: 42);
  Expect.equals(42, a2);
  var (n: num a9 as int, num b9 as int) = (n: 42, -3);
  Expect.equals(42, a9);
  Expect.equals(-3, b9);
  var (:num n3 as int) = (n3: 42);
  Expect.equals(42, n3);
}
