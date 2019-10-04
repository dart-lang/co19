/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static error when the collection is a map and the key type
 * of any of the body elements may not be assigned to the map's key type.
 *
 * @description Checks that it is a static error when the collection is a map
 * and the key type of any of the body elements may not be assigned to the map's
 * key type.
 * @author sgrekhov@unipro.ru
 */

main() {
  <int, int>{if (true) "not int": 1};                 //# 01: compile-time error
  Map<int, int> m = {if (true) "not int": 1};         //# 02: compile-time error
  const <int, int>{if (true) "not int": 1};           //# 03: compile-time error
  <int, int>{for (var i in []) "not int": 1};         //# 04: compile-time error
  Map<int, int> m = {for (var i in []) "not int": 1}; //# 05: compile-time error
}
