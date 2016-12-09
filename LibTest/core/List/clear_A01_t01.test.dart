/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void clear()
 * Removes all objects from this list; the length of the list becomes zero.
 * @description Checks that the length of the list becomes zero.
 * @author vasya
 */
library clear_A01_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {

  void check(List a0) {
    List a = create();
    a.length = a0.length;
    a.setRange(0, a0.length, a0);
    Expect.equals(a0.length, a.length);
    a.clear();
    Expect.equals(0, a.length);
  }
  
  List a = new List();
  check(a);
  a.add(null);
  check(a);

  a.addAll([1,2,3]);
  check(a);

  a.addAll(["one", "two", "three", "four"]);
  check(a);
  a.clear();
  check(a);

  for(var i = 0; i < 96756; i++) {
    a.add(i);
  }
  Expect.isTrue(a.length == 96756);

  a = new List.from([[], [null], [1,2,3,4], ["one", "two", "three", "four"]]);
  check(a);

  a = [[], [null], [1,2,3,4], ["one", "two", "three", "four"]];
  check(a);
}
