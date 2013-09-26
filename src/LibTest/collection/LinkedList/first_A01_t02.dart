/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E first
 * Returns the first element.
 * If this is empty throws a StateError.
 * Otherwise this method is equivalent to this.elementAt(0).
 * @description Checks that the first element of the list is returned.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  const head="head";
  LinkedList a = new LinkedList();
  Expect.equals(0, a.length);
  a.add(head);
  Expect.equals(head, a.first);

  a.add(1);
  Expect.equals(head, a.first);

  LinkedList b = new LinkedList(1000);
  b.elementAt(999) = "top";
  a.addAll(b);
  Expect.equals(head, a.first);
  
  a.length = 236578;
  a.elementAt(236577) = 236578;
  Expect.equals(head, a.first);

  a = new LinkedList(10);
  a.elementAt(0) = 9;
  Expect.equals(9, a.first);

  a = .elementAt(-2, 0, "0", false, -1);
  Expect.equals(-2, a.first);

  a = const .elementAt(null, 0, "0", false);
  Expect.equals(null, a.first);
}
