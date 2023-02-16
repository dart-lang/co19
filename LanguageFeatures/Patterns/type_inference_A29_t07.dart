// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Map:
/// i. Calculate the value's entry key type K and value type V, and key context
///     C:
///   a. If p has type arguments <K, V> for some K and V then use those, and C
///     is K.
///   b. Else if M implements Map<K, V> for some K and V then use those, and C
///     is K.
///   c. Else if M is dynamic then K and V are dynamic and C is _.
///   d. Else K and V are Object? and C is _.
/// ii. Type-check each key expression using C as the context type.
/// iii. Type-check each value subpattern using V as the matched value type.
/// vi. The required type of p is Map<K, V>.
///
/// @description Check that if `p` has no type arguments and `M` implements
/// `Map<K, V>` then value's value type is `V` and key context is `K`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

class C<T> {
  const C();
}

String test1() {
  switch (<C<String>, int>{const C<String>(): 1}) {
    case {const C(): var a}:
      a.expectStaticType<Exactly<int>>();
      return "match";
    default:
      return "no match";
  }
}

String test2() {
  switch (<C<String>, int>{const C<String>(): 1}) {
    case {const C(): final a, ...}:
      a.expectStaticType<Exactly<int>>();
      return "match";
    default:
      return "no match";
  }
}

String test3() {
  if (<C<String>, int>{const C<String>(): 1} case {const C(): var a}) {
    a.expectStaticType<Exactly<int>>();
    return "match";
  }
  return "no match";
}

String test4() {
  if (<C<String>, int>{const C<String>(): 1} case {const C(): final a, ...}) {
    a.expectStaticType<Exactly<int>>();
    return "match";
  }
  return "no match";
}

String test5() =>
  switch (<C<String>, int>{const C<String>(): 1}) {
    {const C(): var a} when a.expectStaticType<Exactly<int>>() is int => "match",
    _ => "no match"
  };

String test6() =>
  switch (<C<String>, int>{const C<String>(): 1}) {
    {const C(): final a, ...} when
        a.expectStaticType<Exactly<int>>() is int => "match",
    _ => "no match"
  };

main() {
  var {const C(): a1} = <C<String>, int>{const C<String>(): 1};
  a1.expectStaticType<Exactly<int>>();

  final {const C(): a2, ...} = <C<String>, int>{const C<String>(): 1, "key2": 2};
  a2.expectStaticType<Exactly<int>>();

  var {1: a3, 2: b3} = {1: "str", 2: bool};
  a3.expectStaticType<Exactly<Object>>();
  b3.expectStaticType<Exactly<Object>>();

  final {1: a4, 2: b4} = {1: "str", 2: bool};
  a4.expectStaticType<Exactly<Object>>();
  b4.expectStaticType<Exactly<Object>>();

  Expect.equals("match", test1());
  Expect.equals("match", test2());
  Expect.equals("match", test3());
  Expect.equals("match", test4());
  Expect.equals("match", test5());
  Expect.equals("match", test6());
}
