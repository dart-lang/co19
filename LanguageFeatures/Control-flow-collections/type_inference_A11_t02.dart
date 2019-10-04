/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If element is an ifElement with one element, p1, and no "else"
 * element:
 * ...
 * If the inferred key type of e1 is K1 and the inferred key type of e1 is V1
 * and the inferred key type of e2 is K2 and the inferred key type of e2 is V2
 * then the inferred key type of element is the least upper bound of K1 and K2
 * and the inferred value type is the least upper bound of V1 and V2.
 *
 * @description Checks that if the inferred key type of e1 is K1 and the
 * inferred key type of e1 is V1 and the inferred key type of e2 is K2 and the
 * inferred key type of e2 is V2 then the inferred key type of element is the
 * least upper bound of K1 and K2 and the inferred value type is the least upper
 * bound of V1 and V2.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  var i = 1;
  var x = {1:1, 2:1, 3:3};
  var y = {1.1: 1.3, 2.2: 2.2, 3.3: 3.3};
  var map1 = {
    if (i > 0) ...x else ...y,
  };
  Expect.isTrue(map1 is Map<num, num>);
  Expect.isFalse(map1 is Map<int, num>);
  Expect.isFalse(map1 is Map<double, num>);
  Expect.isFalse(map1 is Map<num, int>);
  Expect.isFalse(map1 is Map<num, double>);

  var map2 = {
    "": 1,
    if (i < 0) ...?x else ...?y,
  };
  Expect.isTrue(map2 is Map<Object, num>);
  Expect.isFalse(map2 is Map<Object, int>);
  Expect.isFalse(map2 is Map<Object, double>);
  Expect.isFalse(map2 is Map<String, Object>);
  Expect.isFalse(map2 is Map<num, Object>);
}
