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
Map map1 = {2: 2, 7: 18, 9: 3};
Map map2 = {11: 4, 5: 12};
Map map3 = {};
Map? map4 = null;

main() {
  const Map res1 = {...map1};
// [error line 19, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map res2 = <int, int>{...?map1};
// [error line 23, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map res3 = <int, String>{...map2};
// [error line 27, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map res4 = {...?map2};
// [error line 31, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map res5 = {...map3};
// [error line 35, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map res6 = {...?map3};
// [error line 39, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map res7 = {...?map4};
// [error line 43, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map res8 = {100: null, 10: 14, ...map1, 6: 16};
// [error line 47, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map res9 = {15: 15, ...map1, "stop": null, ...map2, ...map3, "a": "a", "b": "b", "c": "c", ...?map4, 208: 18};
// [error line 51, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}
