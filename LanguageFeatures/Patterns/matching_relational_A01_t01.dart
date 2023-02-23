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
/// Relational:
/// i. Evaluate the right-hand constant expression to c.
/// ii. If the operator is ==:
///   a. Let r be the result of v == c.
///   b. The pattern matches if r is true and fails otherwise. This takes into
///     account the built-in semantics that null is only equal to null. The
///     result will always be a bool since operator == on Object is declared to
///     return bool.
/// iii. Else if the operator is !=:
///   a. Let r be the result of v == c.
///   b. The pattern matches if r is false and fails otherwise. This takes into
///     account the built-in semantics that null is only equal to null.
/// iv. Else the operator is a comparison operator op:
///   a. Let r be the result of calling op on v with argument c.
///   b. If r is not a bool then throw a runtime error. This can happen if the
///     operator on v's type returns dynamic.
///   c. The pattern matches if r is true and fails otherwise.
///
/// @description Check that if the operator is `==` then the pattern matches if
/// `v == c`. If `c == null` then only `null` matches.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class C {
  final int? value;
  String log = "";
  C(this.value);

  void clearLog() {
    log = "";
  }

  @override
  bool operator ==(Object? other) {
    log += "C($value)==$other;";
    if (other is int) {
      return this.value == other;
    }
    return this == other;
  }
}

String test1(C? c) {
  switch (c) {
    case == 1:
      return "1";
    case == 2:
      return "2";
    case == null:
      return "null";
    default:
      return "no match";
  }
}

String test2(C? c) {
  if (c case == 1) {
    return "1";
  }
  if (c case == 2) {
    return "2";
  }
  if (c case == null) {
    return "null";
  }
  return "no match";
}

String test3(C? c) {
  return switch (c) {
    == 1 => "1",
    == 2 => "2",
    == null => "null",
    _ => "no match"
  };
}

main() {
  C c1 = C(1);
  C c2 = C(2);
  C c3 = C(3);
  C c4 = C(null);
  Expect.equals("1", test1(c1));
  Expect.equals("C(1)==1;", c1.log);
  Expect.equals("2", test1(c2));
  Expect.equals("C(2)==1;C(2)==2;", c2.log);
  Expect.equals("no match", test1(c3));
  Expect.equals("C(3)==1;C(3)==2;", c3.log);
  Expect.equals("no match", test1(c4));
  Expect.equals("C(null)==1;C(null)==2;", c4.log);
  Expect.equals("null", test1(null));

  c1.clearLog();
  c2.clearLog();
  c3.clearLog();
  c4.clearLog();
  Expect.equals("1", test2(c1));
  Expect.equals("C(1)==1;", c1.log);
  Expect.equals("2", test2(c2));
  Expect.equals("C(2)==1;C(2)==2;", c2.log);
  Expect.equals("no match", test2(c3));
  Expect.equals("C(3)==1;C(3)==2;", c3.log);
  Expect.equals("no match", test2(c4));
  Expect.equals("C(null)==1;C(null)==2;", c4.log);
  Expect.equals("null", test2(null));

  c1.clearLog();
  c2.clearLog();
  c3.clearLog();
  c4.clearLog();
  Expect.equals("1", test3(c1));
  Expect.equals("C(1)==1;", c1.log);
  Expect.equals("2", test3(c2));
  Expect.equals("C(2)==1;C(2)==2;", c2.log);
  Expect.equals("no match", test3(c3));
  Expect.equals("C(3)==1;C(3)==2;", c3.log);
  Expect.equals("no match", test3(c4));
  Expect.equals("C(null)==1;C(null)==2;", c4.log);
  Expect.equals("null", test3(null));
}
