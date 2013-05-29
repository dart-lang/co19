/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E last
 * Returns the last element.
 * @description Checks that the last element of the list is returned.
 * @author vasya
 * @reviewer msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  List a = new List();
  Expect.equals(0, a.length);
  a.add(null);
  Expect.equals(null, a.last);

  a.add(1);
  Expect.equals(1, a.last);

  a.add("1");
  Expect.equals("1", a.last);

  a.add(false);
  Expect.equals(false, a.last);

  List b = new List(1000);
  b[999] = "top";
  a.addAll(b);
  Expect.equals(b[999], a.last);
  
  a.length = 236578;
  a[236577] = 236578;
  Expect.equals(236578, a.last);

  a = new List(10);
  a[9] = 9;
  Expect.equals(9, a.last);

  a = [null, 0, "0", false, -1];
  Expect.equals(-1, a.last);

  a = const [null, 0, "0", false];
  Expect.equals(false, a.last);
}
