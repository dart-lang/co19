// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion To infer the type of element:
/// ...
/// If element is a spreadElement with expression e1:
///
/// If P is ? then let S be the inferred type of e1 in context ?:
/// ...
/// If S is dynamic, then the inferred set element type of element is dynamic,
/// the inferred key type of element is dynamic, and the inferred value type of
/// element is dynamic. (We produce both a set element type here, and a key/value
/// pair here and rely on other elements to disambiguate.)
///
/// @description Checks that if S is dynamic, then the inferred set element type
/// of element is dynamic, the inferred key type of element is dynamic, and the
/// inferred value type of element is dynamic
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

void listTest<T>(T t) {
  Set s1 = {...(t as dynamic)};
  Set s2 = {...?(t as dynamic)};
  Expect.isTrue(s1 is Set<dynamic>);
  Expect.isTrue(s2 is Set<dynamic>);
  checkType(checkIs<Set<dynamic>>, true, s1);
  checkType(checkIs<Set<dynamic>>, true, s2);
}

void mapTest<T>(T t) {
  Map m1 = {...(t as dynamic)};
  Map m2 = {...?(t as dynamic)};
  Expect.isTrue(m1 is Map<dynamic, dynamic>);
  Expect.isTrue(m2 is Map<dynamic, dynamic>);
  checkType(checkIs<Map<dynamic, dynamic>>, true, m1);
  checkType(checkIs<Map<dynamic, dynamic>>, true, m2);
}

main() {
  listTest([]);
  listTest([1, 2, 3]);
  mapTest({});
  mapTest({1: 1, 2: 2, 3: 3 });
}
