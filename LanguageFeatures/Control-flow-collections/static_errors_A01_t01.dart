/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static error when the collection is a list and the type of
 * any of the body elements may not be assigned to the list's element type
 *
 * @description Checks that it is a static error when the collection is a list
 * and the type of any of the body elements may not be assigned to the list's
 * element type
 * @author sgrekhov@unipro.ru
 */

main() {
  <int>[if (true) "not int"];                   //# 01: compile-time error
  const <int>[if (true) "not int"];             //# 02: compile-time error
  List<int> l = [if (true) "not int"];          //# 03: compile-time error

  <int>[for (var i in []) "not int"];           //# 04: compile-time error
  List<int> l = [for (var i in []) "not int"];  //# 05: compile-time error
}
