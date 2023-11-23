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
/// @description Check that pattern matches if result of calling `op` on `v`
/// with argument `c` is `true`. Match fails otherwise
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class C {
  final num value;
  String log = "";
  C(this.value);

  void clearLog() {
    log = "";
  }

  bool operator >(num other) {
    log += "C($value)>$other;";
    return this.value > other;
  }

  bool operator >=(num other) {
    log += "C($value)>=$other;";
    return this.value >= other;
  }

  bool operator <(num other) {
    log += "C($value)<$other;";
    return this.value < other;
  }

  bool operator <=(num other) {
    log += "C($value)<=$other;";
    return this.value <= other;
  }
}

String test1(C c) {
  switch (c) {
    case >= 10:
      return ">=";
    case > 1:
      return ">";
    case < -10:
      return "<";
    case <= -1:
      return "<=";
    default:
      return "no match";
  }
}

String test2(C c) {
  if (c case >= 10) {
    return ">=";
  }
  if (c case > 1) {
    return ">";
  }
  if (c case < -10) {
    return "<";
  }
  if (c case <= -1) {
    return "<=";
  }
  return "no match";
}

String test3(C c) {
  return switch (c) {
    >= 10 => ">=",
    > 1 => ">",
    < -10 => "<",
    <= -1 => "<=",
    _ => "no match"
  };
}

main() {
  C c10 = C(10);
  C c11 = C(11);
  C c2 = C(2);
  C c_1 = C(-1);
  C c_3 = C(-3);
  C c_11 = C(-11);
  C c0 = C(0);

  Expect.equals(">=", test1(c10));
  Expect.equals("C(10)>=10;", c10.log);
  Expect.equals(">=", test1(c11));
  Expect.equals("C(11)>=10;", c11.log);
  Expect.equals(">", test1(c2));
  Expect.equals("C(2)>=10;C(2)>1;", c2.log);
  Expect.equals("<=", test1(c_1));
  Expect.equals("C(-1)>=10;C(-1)>1;C(-1)<-10;C(-1)<=-1;", c_1.log);
  Expect.equals("<=", test1(c_3));
  Expect.equals("C(-3)>=10;C(-3)>1;C(-3)<-10;C(-3)<=-1;", c_3.log);
  Expect.equals("<", test1(c_11));
  Expect.equals("C(-11)>=10;C(-11)>1;C(-11)<-10;", c_11.log);
  Expect.equals("no match", test1(c0));
  Expect.equals("C(0)>=10;C(0)>1;C(0)<-10;C(0)<=-1;", c0.log);

  c10.clearLog();
  c11.clearLog();
  c2.clearLog();
  c_1.clearLog();
  c_3.clearLog();
  c_11.clearLog();
  c0.clearLog();
  Expect.equals(">=", test2(c10));
  Expect.equals("C(10)>=10;", c10.log);
  Expect.equals(">=", test2(c11));
  Expect.equals("C(11)>=10;", c11.log);
  Expect.equals(">", test2(c2));
  Expect.equals("C(2)>=10;C(2)>1;", c2.log);
  Expect.equals("<=", test2(c_1));
  Expect.equals("C(-1)>=10;C(-1)>1;C(-1)<-10;C(-1)<=-1;", c_1.log);
  Expect.equals("<=", test2(c_3));
  Expect.equals("C(-3)>=10;C(-3)>1;C(-3)<-10;C(-3)<=-1;", c_3.log);
  Expect.equals("<", test2(c_11));
  Expect.equals("C(-11)>=10;C(-11)>1;C(-11)<-10;", c_11.log);
  Expect.equals("no match", test2(c0));
  Expect.equals("C(0)>=10;C(0)>1;C(0)<-10;C(0)<=-1;", c0.log);

  c10.clearLog();
  c11.clearLog();
  c2.clearLog();
  c_1.clearLog();
  c_3.clearLog();
  c_11.clearLog();
  c0.clearLog();
  Expect.equals(">=", test3(c10));
  Expect.equals("C(10)>=10;", c10.log);
  Expect.equals(">=", test3(c11));
  Expect.equals("C(11)>=10;", c11.log);
  Expect.equals(">", test3(c2));
  Expect.equals("C(2)>=10;C(2)>1;", c2.log);
  Expect.equals("<=", test3(c_1));
  Expect.equals("C(-1)>=10;C(-1)>1;C(-1)<-10;C(-1)<=-1;", c_1.log);
  Expect.equals("<=", test3(c_3));
  Expect.equals("C(-3)>=10;C(-3)>1;C(-3)<-10;C(-3)<=-1;", c_3.log);
  Expect.equals("<", test3(c_11));
  Expect.equals("C(-11)>=10;C(-11)>1;C(-11)<-10;", c_11.log);
  Expect.equals("no match", test3(c0));
  Expect.equals("C(0)>=10;C(0)>1;C(0)<-10;C(0)<=-1;", c0.log);
}
