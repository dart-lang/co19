// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion abstract E removeAt(int index)
/// Throws an error if the index does not point inside the list.
///
/// @description Checks that an error is thrown if the index does not point
/// inside the list.
/// @author kaigorodov

library removeAt_A03_t01;

import "../../../Utils/expect.dart";

test(List<E> create<E>([int length, E fill])) {

  check(List a0, int index) {
    List a = create();
    a.addAll(a0);
    Expect.throws(() {a.removeAt(index);});
  }

  List a0 = [1, 3, 3, 4, 5, 6];
  check(a0, -1);
  check(a0, a0.length);
  check(a0, 30000);
  check(a0, -30000);
}
