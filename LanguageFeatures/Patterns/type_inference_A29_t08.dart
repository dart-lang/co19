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
/// @description Check that each key expression is type checked using C as the
/// context type. Test the refutable context and the case when p has no type
/// arguments and M implements Map<K, V>
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

String test1() {
  switch (<Object, num>{"key1": 1}) {
    case {"key1": var a}:
      return "match";
    default:
      return "no match";
  }
}

String test2() {
  switch (<Object, num>{"key1" as Object: 1}) {
    case {"key1": final a, ...}:
      return "match";
    default:
      return "no match";
  }
}

String test3() {
  if (<Object, num>{"key1" as Object: 1} case {"key1": var a}) {
    return "match";
  }
  return "no match";
}

String test4() {
  if (<Object, num>{"key1" as Object: 1} case {"key1": final a, ...}) {
    return "match";
  }
  return "no match";
}

String test5() =>
  switch (<Object, num>{"key1" as Object: 1}) {
    {"key1": var a} => "match",
    _ => "no match"
  };

String test6() =>
  switch (<Object, num>{"key1" as Object: 1}) {
    {"key1": final a, ...} => "match",
    _ => "no match"
  };

main() {
  Expect.equals("no match", test1());
  Expect.equals("no match", test2());
  Expect.equals("no match", test3());
  Expect.equals("no match", test4());
  Expect.equals("no match", test5());
  Expect.equals("no match", test6());
}
