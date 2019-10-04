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
 * If P is Map<Pk, Pv> then let S be the inferred type of e1 in context P:
 * ...
 * If S is Null and the spread operator is ...?, then the key and value element
 * types are Null.
 *
 * @description Checks that if S is Null and the spread operator is ...?, then
 * the key and value element types are Null
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

Map<K, V> foo<K, V>(Map<K, V> s) => s;

main() {
  Null x = null;
  var m = foo({...?x});
  Expect.isTrue(m is Map<Null, Null>);
}
