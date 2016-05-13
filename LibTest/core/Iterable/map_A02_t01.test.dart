/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable map(dynamic f(E e))
 * ...
 * As long as the returned Iterable is not iterated over, the supplied function
 * f will not be invoked.
 * @description Checks that the supplied function f will not be invoked if
 * the returned Iterable is not iterated over.
 * @author kaigorodov
 */
library map_A02_t01;
import "../../../Utils/expect.dart";

bool invoked = false;

f(var element) {
  invoked = true;
  return element;
}

test(Iterable create([Iterable content])) {
  Iterable a = create();
  a.map(f);
  a = create([22]);
  a.map(f);
  a = create([22, 11]);
  a.map(f);
  a = create([22, 11, 11]);
  a.map(f);
  List l = new List();
  for (int k = 1; k < 200; k++) {
    l.add(k);
  }
  a.map(f);
  Expect.isFalse(invoked);
}
