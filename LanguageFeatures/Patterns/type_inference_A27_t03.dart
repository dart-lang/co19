// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// List:
///
/// i. Calculate the value's element type E:
///
///   a. If p has a type argument T, then E is the type T.
///   b. Else if M implements List<T> for some T then E is T.
///   c. Else if M is dynamic then E is dynamic.
///   d. Else E is Object?.
///
/// ii. Type-check each non-rest element subpattern using E as the matched value
///   type. Note that we calculate a single element type and use it for all
///   subpatterns. In:
///     var [a, b] = [1, 2.3];
///   both a and b use num as their matched value type.
///
/// iii. If there is a matching rest element, type-check its subpattern using
///   List<E> as the matched value type.
///
/// iv. The required type of p is List<E>.
///
/// @description Check that if p has no type argument and if M is dynamic then E
/// is dynamic
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

String test1() {
  dynamic d = <num>[1, 2];
  switch (d) {
    case [var a, var b]:
      Expect.throws(() {a.whatever;}); // a is dynamic
      Expect.throws(() {b.whatever;}); // b is dynamic
      a = "3.14";
      b = [];
      return "match";
    default:
      return "no match";
  }
}

String test2() {
  dynamic d = [1, 2, 3];
  switch (d) {
    case [final a, final b, ...final c]:
      Expect.throws(() {a.whatever;}); // a is dynamic
      Expect.throws(() {b.whatever;}); // b is dynamic
      c.expectStaticType<Exactly<List<dynamic>>>();
      return "match";
    default:
      return "no match";
  }
}

String test3() {
  dynamic d = <num>[1, 2];
  if (d case [var a, var b]) {
    Expect.throws(() {a.whatever;}); // a is dynamic
    Expect.throws(() {b.whatever;}); // b is dynamic
    a = "3.14";
    b = {};
    return "match";
  }
  return "no match";
}

String test4() {
  dynamic d = [1, 2, 3];
  if (d case [final a, final b, ...final c]) {
    Expect.throws(() {a.whatever;}); // a is dynamic
    Expect.throws(() {b.whatever;}); // b is dynamic
    c.expectStaticType<Exactly<List<dynamic>>>();
    return "match";
  }
  return "no match";
}

String test5() {
  dynamic d = <num>[1, 2];
  return switch (d) {
    [var a, var b] when ((a = "3.14") is String) && ((b = []) is List)
        => "match",
    _ => "no match"
  };
}

String test6() {
  dynamic d = [1, 2, 3];
  return switch (d) {
    [final a, final b, ...final c] when
        c.expectStaticType<Exactly<List<dynamic>>>() is List<int> => "match",
    _ => "no match"
  };
}

main() {
  dynamic d = <num>[1, 2];
  var [a1, b1] = d;
  Expect.throws(() {a1.whatever;}); // a1 is dynamic
  Expect.throws(() {b1.whatever;}); // b1 is dynamic
  a1 = 3.14;
  b1 = ["3.14"];
  d = [1, 2, 3];
  final [a2, b2, ...c2] = d;
  Expect.throws(() {a2.whatever;}); // a2 is dynamic
  Expect.throws(() {b2.whatever;}); // b2 is dynamic;
  c2.expectStaticType<Exactly<List<dynamic>>>();

  Expect.equals("match", test1());
  Expect.equals("match", test2());
  Expect.equals("match", test3());
  Expect.equals("match", test4());
  Expect.equals("match", test5());
  Expect.equals("match", test6());
}
