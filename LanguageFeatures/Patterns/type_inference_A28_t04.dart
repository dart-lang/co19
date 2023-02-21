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
/// @description Check that if `p` has no type argument and if `M` doesn't
/// implement `List<T>` and is not `dynamic` then `E` is `Object?`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

String test1() {
  switch ([] as Object) {
    case [var a, var b]:
      a.expectStaticType<Exactly<Object?>>();
      b.expectStaticType<Exactly<Object?>>();
      a = "3.14";
      b = null;
      return "match";
    default:
      return "no match";
  }
}

String test2() {
  switch ([] as Object) {
    case [final a, final b, ...final c]:
      a.expectStaticType<Exactly<Object?>>();
      b.expectStaticType<Exactly<Object?>>();
      c.expectStaticType<Exactly<List<Object?>>>();
      return "match";
    default:
      return "no match";
  }
}

String test3() {
  if ([] as Object case [var a, var b]) {
    a.expectStaticType<Exactly<Object?>>();
    b.expectStaticType<Exactly<Object?>>();
    a = "3.14";
    b = null;
    return "match";
  }
  return "no match";
}

String test4() {
  if ([] as Object case [final a, final b, ...final c]) {
    a.expectStaticType<Exactly<Object?>>();
    b.expectStaticType<Exactly<Object?>>();
    c.expectStaticType<Exactly<List<Object?>>>();
    return "match";
  }
  return "no match";
}

String test5() {
  return switch ([] as Object) {
    [var a, var b] when (a.expectStaticType<Exactly<Object?>>() is Object? &&
        b.expectStaticType<Exactly<Object?>>() is Object?) => "match",
    _ => "no match"
  };
}

String test6() {
  return switch ([] as Object) {
    [final a, final b, ...final c] when
        a.expectStaticType<Exactly<Object?>>() is Object? &&
        b.expectStaticType<Exactly<Object?>>() is Object? &&
        c.expectStaticType<Exactly<List<Object?>>>() is List<Object?> => "match",
    _ => "no match"
  };
}

main() {
  Expect.throws(() {
    var [a1, b1] = [];
    a1.expectStaticType<Exactly<Object?>>();
    b1.expectStaticType<Exactly<Object?>>();
  });

  Expect.throws(() {
    final [a2, b2, ...c2] = [];
    a2.expectStaticType<Exactly<Object?>>();
    b2.expectStaticType<Exactly<Object?>>();
    c2.expectStaticType<Exactly<List<Object?>>>();
  });

  Expect.equals("no match", test1());
  Expect.equals("no match", test2());
  Expect.equals("no match", test3());
  Expect.equals("no match", test4());
  Expect.equals("no match", test5());
  Expect.equals("no match", test6());
}
