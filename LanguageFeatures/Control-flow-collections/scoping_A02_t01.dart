/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Each iteration of the loop binds a new fresh variable
 *
 * @description Checks that each iteration of the loop binds a new fresh
 * variable
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  var closures = [
    for (var i = 1; i < 4; i++) () => i++
  ];
  int count = 1;
  for (var closure in closures) {
    Expect.equals(count++, closure());
  }
  count = 2;
  for (var closure in closures) {
    Expect.equals(count++, closure());
  }
}
