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
/// the matched value type. Test the refutable context and the case when `p` has
/// no type arguments `<K, V>` and `M` is dynamic
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1() {
  switch ({"key1": 1 as num} as dynamic) {
    case {"key1": var  a}:
      Expect.throws(() {
        a.whatever; // a is dynamic
      });
      return "match";
    default:
      return "no match";
  }
}

String test2() {
  switch ({"key1": 1 as num} as dynamic) {
    case {"key1": final a, ...}:
      Expect.throws(() {
        a.whatever;
      });
      return "match";
    default:
      return "no match";
  }
}

String test3() {
  if ({"key1": 1 as num} as dynamic case {"key1": var a}) {
    Expect.throws(() {
      a.whatever;
    });
    return "match";
  }
  return "no match";
}

String test4() {
  if ({"key1": 1 as num}  as dynamic case {"key1": final a, ...}) {
    Expect.throws(() {
      a.whatever;
    });
    return "match";
  }
  return "no match";
}

String test5() =>
  switch ({"key1": 1 as num} as dynamic) {
    {"key1": var a} when a.whatever => "match",
    _ => "no match"
  };

String test6() =>
  switch ({"key1": 1 as num} as dynamic) {
    {"key1": final a, ...}  when a.whatever => "match",
    _ => "no match"
  };

main() {
  Expect.equals("match", test1());
  Expect.equals("match", test2());
  Expect.equals("match", test3());
  Expect.equals("match", test4());
  Expect.throws(() {test5();});
  Expect.throws(() {test6();});
}
