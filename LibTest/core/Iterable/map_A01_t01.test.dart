// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Iterable map(dynamic f(E e))
/// Returns a new lazy Iterable with elements that are created by calling f on e
/// ach element of this Iterable in iteration order.
/// @description Checks that the resulting Iterable contains all the results of
/// calling f(e).
/// @author kaigorodov

library map_A01_t01;

import "../../../Utils/expect.dart";

f(var element) {
  return [element];
}
  
void checkResult(Iterable a) {
  int count = 0;
  Iterable mapIter = a.map(f);
  for (var el in mapIter) {
    Expect.listEquals(f(a.elementAt(count++)), el);
  }
  Expect.equals(a.length, count);
}

test(Iterable create([Iterable content])) {
  Iterable a = create();
  checkResult(a);
  a = create([22]);
  checkResult(a);
  a = create([22, 11]);
  checkResult(a);
  a = create([22, 11, 11]);
  checkResult(a);
  List l = [];
  for (int k = -100; k < 200; k++) {
    l.add(k);
  }
  checkResult(create(l));
}
