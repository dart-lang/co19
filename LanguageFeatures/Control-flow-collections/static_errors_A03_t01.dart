/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static error when the collection  is a map and the value
 * type of any of the body elements may not be assigned to the map's value type
 *
 * @description Checks that it is a static error when the collection  is a map
 * and the value type of any of the body elements may not be assigned to the
 * map's value type
 * @author sgrekhov@unipro.ru
 */

main() {
  <int, int>{if (true) 1: "not int"};                 //# 01: compile-time error
  Map<int, int> m = {if (true) 1: "not int"};         //# 02: compile-time error
  const <int, int>{if (true) 1: "not int"};           //# 03: compile-time error
  <int, int>{for (var i in []) 1: "not int"};         //# 04: compile-time error
  Map<int, int> m = {for (var i in []) 1: "not int"}; //# 05: compile-time error
}
