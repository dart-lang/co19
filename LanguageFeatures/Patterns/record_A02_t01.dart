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
/// @description Checks record patterns with a logical-and subpattern in a
/// declaration context
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";

main() {
  var (a11 && a12,) = (-1,);
  Expect.equals(-1, a11);
  Expect.equals(-1, a12);
  var (n: a21 && a22) = (n: 42);
  Expect.equals(42, a21);
  Expect.equals(42, a22);
  var (n: a31 && a32, b31 && b32) = (n: 42, -1);
  Expect.equals(42, a31);
  Expect.equals(42, a32);
  Expect.equals(-1, b31);
  Expect.equals(-1, b31);

  final (a41 && a42,) = (-1,);
  Expect.equals(-1, a41);
  Expect.equals(-1, a42);
  final (n: a51 && a52) = (n: 42);
  Expect.equals(42, a51);
  Expect.equals(42, a52);
  final (n: a61 && a62, b61 && b62) = (n: 42, -1);
  Expect.equals(42, a61);
  Expect.equals(42, a62);
  Expect.equals(-1, b61);
  Expect.equals(-1, b62);

  var (int a71 && a72,) = (-1,);
  Expect.equals(-1, a71);
  Expect.equals(-1, a72);
  var (n: int a81 && a82) = (n: 42);
  Expect.equals(42, a81);
  Expect.equals(42, a82);
  var (n: int a91 && a92, num b91 && b92) = (n: 42, -3.14);
  Expect.equals(42, a91);
  Expect.equals(42, a92);
  Expect.equals(-3.14, b91);
  Expect.equals(-3.14, b92);
}
