// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If element is a forElement with element e1 then:
///
/// Inference for the iterated expression and the controlling variable is done as
/// for the corresponding for or await for statement.
///
/// If the inferred key type of e1 is K and the inferred key type of e1 is V then
/// the inferred key and value types of element are K and V
///
/// @description Checks that if element is a forElement with element e1 then if
/// the inferred key type of e1 is K and the inferred key type of e1 is V then
/// the inferred key and value types of element are K and V
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

main() {
  var c1 = {1: 1, 2: 2, 3: 3} as Map<int, int>?;
  var c2 = {1.1: 1.1, 2.2: 2.2, 3.3: 3.3} as Map<double, double>?;

  var map1 = {
  for (var i = 1; i < 5; i++)
    if (i.isEven) ...?c1 else ...?c2
  };
  Expect.isTrue(map1 is Map<num, num>);
  Expect.isFalse(map1 is Map<int, num>);
  Expect.isFalse(map1 is Map<double, num>);
  Expect.isFalse(map1 is Map<num, int>);
  Expect.isFalse(map1 is Map<num, double>);
  checkType(checkIs<Map<num, num>>, true, map1);
  checkType(checkIs<Map<int, num>>, false, map1);
  checkType(checkIs<Map<double, num>>, false, map1);
  checkType(checkIs<Map<num, int>>, false, map1);
  checkType(checkIs<Map<num, double>>, false, map1);

  var map2 = {
    "": "",
    for (var i = 1; i < 5; i++)
      if (i.isEven) ...?c1 else ...?c2
  };
  Expect.isTrue(map2 is Map<Object, Object>);
  Expect.isFalse(map2 is Map<Object, num>);
  Expect.isFalse(map2 is Map<Object, String>);
  Expect.isFalse(map2 is Map<String, Object>);
  Expect.isFalse(map2 is Map<num, Object>);
  checkType(checkIs<Map<Object, Object>>, true, map2);
  checkType(checkIs<Map<Object, num>>, false, map2);
  checkType(checkIs<Map<Object, String>>, false, map2);
  checkType(checkIs<Map<String, Object>>, false, map2);
  checkType(checkIs<Map<num, Object>>, false, map2);

  c1 = null;
  c2 = null;
  var map3 = {
    for (var i = 1; i < 5; i++)
      if (i.isEven) ...?c1 else ...?c2
  };
  Expect.isTrue(map3 is Map<num, num>);
  Expect.isFalse(map3 is Map<int, num>);
  Expect.isFalse(map3 is Map<double, num>);
  Expect.isFalse(map3 is Map<num, int>);
  Expect.isFalse(map3 is Map<num, double>);
  checkType(checkIs<Map<num, num>>, true, map3);
  checkType(checkIs<Map<int, num>>, false, map3);
  checkType(checkIs<Map<double, num>>, false, map3);
  checkType(checkIs<Map<num, int>>, false, map3);
  checkType(checkIs<Map<num, double>>, false, map3);
}
