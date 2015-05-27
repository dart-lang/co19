/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E first
 * Returns the first element.
 * @description Checks that the first element of the list is returned.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

main() {
  const head="head";
  List a = new List();
  Expect.equals(0, a.length);
  a.add(head);
  Expect.equals(head, a.first);

  a.add(1);
  Expect.equals(head, a.first);

  List b = new List(1000);
  b[999] = "top";
  a.addAll(b);
  Expect.equals(head, a.first);
  
  a.length = 236578;
  a[236577] = 236578;
  Expect.equals(head, a.first);

  a = new List(10);
  a[0] = 9;
  Expect.equals(9, a.first);

  a = [-2, 0, "0", false, -1];
  Expect.equals(-2, a.first);

  a = const [null, 0, "0", false];
  Expect.equals(null, a.first);
}
