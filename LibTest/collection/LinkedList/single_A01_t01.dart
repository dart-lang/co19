/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E single
 * Returns the single element in this.
 * @description Checks that the single element is returned.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

var v;

void check(List a0) {
  LinkedList a = toLinkedList(a0);
  if (a.length == 1) {
    Expect.equals(a.first, a.single);
  } else {
    Expect.throws(() { a.single; }, (e) => e is StateError);
  }
}

main() {
  check([]);
  List a = new List();
  check(a);
  a.add(0);
  check(a);
  a.length = 25476;
  check(a);
  a.clear();
  a.length = 1;
  check(a);
  a = const[];
  check(a);
  a = const[1];
  check(a);
}
