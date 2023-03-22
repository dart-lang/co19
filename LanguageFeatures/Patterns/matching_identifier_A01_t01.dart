// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At runtime, a pattern is matched against a value. This determines
/// whether or not the match fails and the pattern refutes the value. If the
/// match succeeds, the pattern may also destructure data from the object or
/// bind variables.
///
/// Refutable patterns usually occur in a context where match refutation causes
/// execution to skip over the body of code where any variables bound by the
/// pattern are in scope. If a pattern match failure occurs in an irrefutable
/// context, a runtime error is thrown.
///
/// To match a pattern p against a value v:
/// ...
/// Identifier:
/// i. In a matching context, the same as a constant pattern whose constant
///   expression is the identifier.
/// ii. Else, the same as a variable pattern with the same identifier.
///
/// @description Checks that in a matching context an identifier pattern matches
/// if `c == v`, where `c` is the pattern's value, evaluates to `true`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class C {
  final int _value;
  final void Function(String s) _logger;
  const C(this._value, this._logger);

  @override
  bool operator ==(Object other) {
    _logger("$this==$other;");
    if (other is int) {
      return this._value == other;
    }
    if (other is C) {
      return this._value == other._value;
    }
    return false;
  }

  @override
  String toString() => "C($_value)";

  @override
  int get hashCode => throw "Never used";
}

StringBuffer log = StringBuffer();

void logger(String s) {
  log.write(s);
}

const c1 = C(1, logger);

String test1(Object o) {
  switch (o) {
    case c1:
      return "match-1";
    case 2:
      return "match-2";
    default:
      return "no match";
  }
}

String test2(Object o) {
  if (o case c1) {
    return "match-1";
  }
  if (o case 2) {
    return "match-2";
  }
  return "no match";
}

String test3(Object o) {
  return switch (o) {
    c1 => "match-1",
    2 => "match-2",
    _ => "no match"
  };
}

main() {
  C c2 = C(2, logger);

  Expect.equals("match-1", test1(1));
  Expect.equals("C(1)==1;", log.toString());
  log.clear();
  Expect.equals("no match", test1(c2));
  Expect.equals("C(1)==C(2);", log.toString());
  log.clear();
  Expect.equals("match-2", test1(2));
  Expect.equals("C(1)==2;", log.toString());
  log.clear();

  Expect.equals("match-1", test2(1));
  Expect.equals("C(1)==1;", log.toString());
  log.clear();
  Expect.equals("no match", test2(c2));
  Expect.equals("C(1)==C(2);", log.toString());
  log.clear();
  Expect.equals("match-2", test2(2));
  Expect.equals("C(1)==2;", log.toString());
  log.clear();

  Expect.equals("match-1", test3(1));
  Expect.equals("C(1)==1;", log.toString());
  log.clear();
  Expect.equals("no match", test3(c2));
  Expect.equals("C(1)==C(2);", log.toString());
  log.clear();
  Expect.equals("match-2", test3(2));
  Expect.equals("C(1)==2;", log.toString());
}
