// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion abstract Iterable<E> getRange(int start, int end)
/// An error occurs if the start and end are not valid ranges at the time of the
/// call to this method.
///
/// @description Checks that an error is thrown if the start and end are not
/// valid ranges.
/// @author vasya

library getRange_A03_t01;

import "../../../Utils/expect.dart";

test(List<E> create<E>([int length, E fill])) {

  void check1(List list, int start, int length) {
    Expect.throws(() {list.getRange(start, start + length);});
  }

  void check(List a0, int start, int end) {
    List list = create();
    list.addAll(a0);
    check1(list, start, end);

    list = create(a0.length, 0);
    list.setRange(0, a0.length, a0);
    check1(list, start, end);    
  }

  check(new List.filled(0, 0), 0, 1);
  check(new List.filled(10, 0), 1, 10);
  check(new List.filled(1099, 0), 0, 1100);
  check(new List.filled(10789, 0), 10000, 10000);

  List l = new List.empty(growable: true);
  check(l, 0, 1);
  l.length = 10;
  check(l, 1, 10);
  l.length = 1099;
  check(l, 0, 1100);
  l.length = 10789;
  check(l, 10000, 10000);

  l = [];
  check(l, 0, 1);
  l.length = 10;
  check(l, 1, 10);
  l.length = 1099;
  check(l, 0, 1100);
  l.length = 10789;
  check(l, 10000, 10000);
}
