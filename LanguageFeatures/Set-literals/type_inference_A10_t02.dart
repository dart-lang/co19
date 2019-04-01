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
 * If S is Null and the spread operator is ...? then the element has set element
 * type Null, map key type Null and map value type Null.
 *
 * @description Checks that if S is Null and the spread operator is ...? then
 * the element has set element type Null, map key type Null and map value type
 * Null. Test Set
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections,constant-update-2018
import "../../Utils/expect.dart";

Map<X, Y> foo<X, Y>(Map<X, Y> m) => m;

void test<T>(T t) {
  var m = foo({...?t});
  Expect.isTrue(m is Map<Null, Null>);
}

main() {
  test(null);
}
