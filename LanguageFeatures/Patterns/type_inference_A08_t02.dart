// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// Map: A type schema Map<K, V> where:
/// i. If p has type arguments then K, and V are those type arguments.
/// ii.  Else if p has no entries, then K and V are _.
/// iii. Else K is _ and V is the greatest lower bound of the context type
///     schemas of all value subpatterns.
///
/// @description Check that if map pattern p has type arguments then K, and V
/// are those type arguments.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/static_type_helper.dart";

main() {
  try {
    var ({} && m) = {"key1": 1, "key2": 1, "key3": 3};
    m.expectStaticType<Exactly<Map<String, int>>();
  } catch (_) {}
  try {
    var ({} && Map<String, num> m) = {"key1": 1, "key2": 1, "key3": 3};
    m.expectStaticType<Exactly<Map<String, num>>();
  } catch (_) {}
  var ({} && Map<String, num> m) = {};
  m.expectStaticType<Exactly<Map<String, num>>();
}
