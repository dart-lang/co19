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
/// @description Check that each value subpattern is type checked using `V` as
/// the matched value type. Test that it is not an error if in the refutable
/// context type test fails. The case when `p` has type arguments `<K, V>`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1(dynamic d) {
  switch (d) {
    case <String, int>{"key1": String a}:
      return "match";
    default:
      return "no match";
  }
}

String test2(dynamic d) {
  switch (d) {
    case <String, int>{"key1": final String a}:
      return "match";
    default:
      return "no match";
  }
}

String test3(dynamic d) {
  if (d case <String, int>{"key1": String a}) {
    return "match";
  }
  return "no match";
}

String test4(dynamic d) {
  if (d case <String, int>{"key1": final String a}) {
    return "match";
  }
  return "no match";
}

String test5(dynamic d) =>
  switch (d) {
    <String, int>{"key1": String a} => "match",
    _ => "no match"
  };

String test6(dynamic d) =>
  switch (d) {
    <String, int>{"key1": final String a} => "match",
    _ => "no match"
  };

main() {
  Expect.equals("no match", test1({"key1": 42}));
  Expect.equals("no match", test1({"key1": "42"}));
  Expect.equals("no match", test2({"key1": 42}));
  Expect.equals("no match", test2({"key1": "42"}));
  Expect.equals("no match", test3({"key1": 42}));
  Expect.equals("no match", test3({"key1": "42"}));
  Expect.equals("no match", test4({"key1": 42}));
  Expect.equals("no match", test4({"key1": "42"}));
  Expect.equals("no match", test5({"key1": 42}));
  Expect.equals("no match", test5({"key1": "42"}));
  Expect.equals("no match", test6({"key1": 42}));
  Expect.equals("no match", test6({"key1": "42"}));
}
