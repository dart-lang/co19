/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @It is a compile-time error to use a spread element in a constant map unless
 * the spread object was created by from a constant map literal expression.
 * @description Checks that only constant map literal can be a spread element in
 * the constant spread map
 * @author iarkh@unipro.ru
 */

main() {
  Map map1 = {2: 2, 7: 18, 9: 3};
  Map map2 = {11: 4, 5: 12};
  Map map3 = {};
  Map map4 = null;

  const Map res1 = {...map1};                           //# 01: compile-time error
  const Map res2 = <int, int>{...?map1};                //# 02: compile-time error
  const Map res3 = <int, String>{...map2};              //# 03: compile-time error
  const Map res4 = {...?map2};                          //# 04: compile-time error
  const Map res5 = {...map3};                           //# 05: compile-time error
  const Map res6 = {...?map3};                          //# 06: compile-time error
  const Map res7 = {...?map4};                          //# 07: compile-time error
  const Map res8 = {100: null, 10: 14, ...map1, 6: 16}; //# 08: compile-time error
  const Map res9 = {15: 15, ...map1, "stop": null, ...map2, ...map3, "a": "a", "b": "b", "c": "c", ...?map4, 208: 18};  //# 09: compile-time error
}
