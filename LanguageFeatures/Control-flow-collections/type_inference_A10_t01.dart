/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If element is an ifElement with two elements, e1 and e2:
 * ...
 * It is a compile error if e1 must be a set and e2 must be a map or vice versa.
 *
 * @description Checks that it is a compile error if e1 must be a set and e2
 * must be a map or vice versa.
 * @author sgrekhov@unipro.ru
 */

main() {
  var i = 1;
  var v1 = {if (i > 0) "" else "": "",};        //# 01: compile-time error

  var x = [1, 2, 3];
  var y = {1: "1", 2: "2", 3: "3"};
  var v2 = {"", if (i < 0) ...x else ...y,};    //# 02: compile-time error

  var v3 = {"", if (i < 0) ...?x else ...?y,};  //# 03: compile-time error
}
