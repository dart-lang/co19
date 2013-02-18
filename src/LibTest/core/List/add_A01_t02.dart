/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds [value] at the end of the list, extending the length by one.
 * @description Checks that method does not affect the existing content of the list
 * @author vasya
 * @reviewer iefremov
 * @reviewer msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  List a = new List();
  Expect.isTrue(a.length == 0);
  a.add(null);
  Expect.listEquals([null], a);
  a.add(0);
  Expect.listEquals([null, 0], a);
  a.add("1");
  Expect.listEquals([null, 0, "1"], a);
}
