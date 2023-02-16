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
/// @description Check that if `p` has no type arguments and `M` doesn't
/// implement `Map<K, V>` and is not `dynamic` then `V` is `Object?`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/static_type_helper.dart";
import "../../Utils/expect.dart";

String test1() {
  switch ({} as Object) {
    case {"key1": var a}:
      a.expectStaticType<Exactly<Object?>>();
      return "match";
    default:
      return "no match";
  }
}

String test2() {
  switch ({} as Object) {
    case {"key1": final a, ...}:
      a.expectStaticType<Exactly<Object?>>();
      return "match";
    default:
      return "no match";
  }
}

String test3() {
  if ({} as Object case {"key1": var a}) {
    a.expectStaticType<Exactly<Object?>>();
    return "match";
  }
  return "no match";
}

String test4() {
  if ({} as Object case {"key1": final a, ...}) {
    a.expectStaticType<Exactly<Object?>>();
    return "match";
  }
  return "no match";
}

String test5() =>
  switch ({} as Object) {
    {"key1": var a} when
        (a.expectStaticType<Exactly<Object?>>() is Object?) => "match",
    _ => "no match"
  };

String test6() =>
  switch ({} as Object) {
    {"key1": final a, ...} when
        (a.expectStaticType<Exactly<Object?>>() is Object?) => "match",
    _ => "no match"
  };

main() {
  Expect.throws(() {
    var {"key1": a1} = {};
    a1.expectStaticType<Exactly<Object?>>();
  });
  Expect.throws(() {
    final {"key1": a2, ...} = {};
  });
  Expect.equals("no match", test1());
  Expect.equals("no match", test2());
  Expect.equals("no match", test3());
  Expect.equals("no match", test4());
  Expect.equals("no match", test5());
  Expect.equals("no match", test6());
}
