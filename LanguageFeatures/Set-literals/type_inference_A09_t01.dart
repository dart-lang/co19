/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion To infer the type of element:
 * ...
 * If element is a spreadElement with expression e1:
 *
 * If P is ? then let S be the inferred type of e1 in context ?:
 * ...
 * If S is dynamic, then the inferred set element type of element is dynamic,
 * the inferred key type of element is dynamic, and the inferred value type of
 * element is dynamic. (We produce both a set element type here, and a key/value
 * pair here and rely on other elements to disambiguate.)
 *
 * @description Checks that if S is dynamic, then the inferred set element type
 * of element is dynamic, the inferred key type of element is dynamic, and the
 * inferred value type of element is dynamic
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections,constant-update-2018
import "../../Utils/expect.dart";

void test1<T>(T t) {
  Set s1 = {...t};
  Set s2 = {...?t};
  Expect.isTrue(s1 is Set<dynamic>);
  Expect.isTrue(s2 is Set<dynamic>);
}

void test2<T>(T t) {
  Map m1 = {...t};
  Map m2 = {...?t};
  Expect.isTrue(m1 is Map<dynamic, dynamic>);
  Expect.isTrue(m2 is Map<dynamic, dynamic>);
}

main() {
  test1([]);
  test1([1, 2, 3]);
  test2({});
  test2({1: 1, 2: 2, 3: 3 });
}
