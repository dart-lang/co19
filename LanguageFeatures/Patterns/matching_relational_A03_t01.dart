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
/// @description Check that it is a run-time error if the result of calling `op`
/// on 'v' with argument `c` is not `bool`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class C {
  final int value;
  String log = "";
  C(this.value);

  void clearLog() {
    log = "";
  }

  dynamic operator >(num other) {
    log += "C($value)>$other;";
    return this.value - other;
  }
}

String test1(C c) {
  switch (c) {
    case > 1:
      return "1";
    default:
      return "no match";
  }
}

String test2(C c) {
  if (c case > 1) {
    return "1";
  }
  return "no match";
}

String test3(C c) {
  return switch (c) {
    > 1 => "1",
    _ => "no match"
  };
}

main() {
  C c1 = C(0);
  C c2 = C(2);
  Expect.throws(() {
    test1(c1);
  });
  Expect.equals("C(0)>1;", c1.log);
  Expect.throws(() {
    test1(c2);
  });
  Expect.equals("C(2)>1;", c2.log);

  c1.clearLog();
  c2.clearLog();
  Expect.throws(() {
    test2(c1);
  });
  Expect.equals("C(0)>1;", c1.log);
  Expect.throws(() {
    test2(c2);
  });
  Expect.equals("C(2)>1;", c2.log);

  c1.clearLog();
  c2.clearLog();
  Expect.throws(() {
    test3(c1);
  });
  Expect.equals("C(0)>1;", c1.log);
  Expect.throws(() {
    test3(c2);
  });
  Expect.equals("C(2)>1;", c2.log);
}
