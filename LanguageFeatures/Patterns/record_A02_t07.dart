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
/// @description Checks record patterns with a map subpattern in a declaration
/// context
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

main() {
  var ({1: a1},) = ({1: -1},);
  Expect.equals(-1, a1);
  var (n: {2: a2}) = (n: {2: 42});
  Expect.equals(42, a2);
  var (n: {3: a3}, {3: b3}) = (n: {3: 42}, {3: -1});
  Expect.equals(42, a3);
  Expect.equals(-1, b3);

  final ({4: a4},) = ({4: -1},);
  Expect.equals(-1, a4);
  final (n: {5: a5}) = (n: {5: 42});
  Expect.equals(42, a5);
  final (n: {6: a6}, {6: b6}) = (n: {6: 42}, {6: -1});
  Expect.equals(42, a6);
  Expect.equals(-1, b6);

  var ({7: num a7},) = ({7: -1},);
  Expect.equals(-1, a7);
  var (n: <int, num>{8: num a8}) = (n: {8: 42});
  Expect.equals(42, a8);
  var (n: {9: num a9}, {9: num b9}) = (n: {9: 42}, {9: -3});
  Expect.equals(42, a9);
  Expect.equals(-3, b9);
}
