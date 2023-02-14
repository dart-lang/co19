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
/// context type. The case when p has type no arguments and M is dynamic. Test
/// that in irrefutable context it is a run-time error if key expression fails a
/// type check.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

main() {
  var {"key1": a1} = {"key1" as Object: 1} as dynamic;
  Expect.equals(1, a1);
  final {"key1": a2, ...} = {"key1" as Object: 1, "key2": 2};
  Expect.equals(1, a2);

  Expect.throws(() {
    var {"key1": a3} = {42: 1} as dynamic;
  });
  Expect.throws(() {
    final {"key1": a4} = {42: 1} as dynamic;
  });
}
