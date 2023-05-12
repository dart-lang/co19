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
/// @description Check that if `p` has a type argument `T1` and `M` implements
/// `List<T2>`, then `E` is the type `T1`.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

String test1() {
  switch (<int>[1, 2]) {
    case <num>[var a, var b]:
      a.expectStaticType<Exactly<num>>();
      b.expectStaticType<Exactly<num>>();
      a = 3.14;
      b = 3.14;
      return "match";
    default:
      return "no match";
  }
}

String test2() {
  switch (<int>[1, 2, 3]) {
    case <num>[final a, final b, ...final c]:
      a.expectStaticType<Exactly<num>>();
      b.expectStaticType<Exactly<num>>();
      c.expectStaticType<Exactly<List<num>>>();
      return "match";
    default:
      return "no match";
  }
}

String test3() {
  if (<int>[1, 2] case <num>[var a, var b]) {
    a.expectStaticType<Exactly<num>>();
    b.expectStaticType<Exactly<num>>();
    a = 3.14;
    b = 3.14;
    return "match";
  }
  return "no match";
}

String test4() {
  if (<int>[1, 2, 3] case <num>[final a, final b, ...final c]) {
    a.expectStaticType<Exactly<num>>();
    b.expectStaticType<Exactly<num>>();
    c.expectStaticType<Exactly<List<num>>>();
    return "match";
  }
  return "no match";
}

String test5() =>
  switch (<int>[1, 2]) {
    <num>[var a, var b] when
        a.expectStaticType<Exactly<num>>() is num &&
        b.expectStaticType<Exactly<num>>() is num => "match",
    _ => "no match"
  };

String test6() =>
  switch (<int>[1, 2, 3]) {
    <num>[final a, final b, ...final c] when
        a.expectStaticType<Exactly<num>>() is num &&
        b.expectStaticType<Exactly<num>>() is num &&
        c.expectStaticType<Exactly<List<num>>>() is List<num> => "match",
    _ => "no match"
  };

main() {
  var <num>[a1, b1] = <int>[1, 2];
  a1.expectStaticType<Exactly<num>>();
  b1.expectStaticType<Exactly<num>>();
  a1 = 3.14;
  b1 = 3.14;
  final <num>[a2, b2, ...c2] = <int>[1, 2, 3];
  a2.expectStaticType<Exactly<num>>();
  b2.expectStaticType<Exactly<num>>();
  c2.expectStaticType<Exactly<List<num>>>();

  Expect.equals("match", test1());
  Expect.equals("match", test2());
  Expect.equals("match", test3());
  Expect.equals("match", test4());
  Expect.equals("match", test5());
  Expect.equals("match", test6());
}
