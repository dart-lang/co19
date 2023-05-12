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
/// @description Check that each value subpattern is type checked using `C` as
/// the context type. The case when `p` has no type arguments and `M` is
/// `dynamic`. Test irrefutable context
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

main() {
  var {"key1": a1} = {"key1": 1 as num} as dynamic;
  Expect.throws(() {
    a1.whatever; // a1 id dynamic
  });
  final {"key1": a2} = {"key1": 1 as num, "key2": 2} as dynamic;
  Expect.throws(() {
    a2.whatever;
  });
}
