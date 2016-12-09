/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E single
 * Returns the single element in this.
 * If this is empty or has more than one element throws a StateError.
 * @description Checks that the single element is returned.
 * Checks that StateError is thrown if this list is empty or has more than one
 * element
 * @author kaigorodov
 */
library single_A01_t01;

import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  void check(List content) {
    Iterable a = create(content);
    if (a.length == 1) {
      Expect.equals(a.elementAt(0), a.single);
    } else {
      Expect.throws(() {a.single;}, (e) => e is StateError);
    }
  }
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
