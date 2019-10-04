/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion To infer the type of element:
 * ...
 * If element is a spreadElement with expression e1:
 * ...
 * If P is Set<Ps> then let S be the inferred type of e1 in context Iterable<Ps>:
 * ...
 * If S is Null and the spread operator is ...?, then the set element type is
 * Null.
 *
 * @description Checks that if S is Null and the spread operator is ...?, then
 * the set element type is Null.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

Set<X> foo<X>(Set<X> s) => s;

main() {
  Null x = null;
  var s = foo({...?x});
  Expect.isTrue(s is Set<Null>);
}
