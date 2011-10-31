/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The created list is extendable.
 * @description Checks that the created list can change it's size.
 * @author varlax
 * @reviewer msyabro
 */

void check(List l) {
  int len = l.length;
  l.add(null);
  Expect.equals(len + 1, l.length);

  l.clear();
  Expect.equals(0, l.length);
}

main() {
  check(new List.fromList([], 0, 0));

  List l = new List();
  l.addAll(["1","2","3","4","5"]);
  List a = new List.fromList(l, 0, 5);
  check(a);

  List src = [null, [null], [], [1,2,3], [[null]]];
  a = new List.fromList(src, 0, 5);
  check(a);

  src = new List(34567);
  src[34566] = -111111111;
  a = new List.fromList(src, 0, 1);
  check(a);
}
