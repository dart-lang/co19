// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion abstract E removeAt(int index)
/// Throws an error if index is not an int.
/// @description Checks that an error is thrown if index is not an int.
/// @author kaigorodov

library removeAt_A02_t01;

import "../../../Utils/expect.dart";

test(List<E> create<E>([int length, E fill])) {

  check(List a0, var index) {
    List a = create();
    a.addAll(a0);
    Expect.throws(() {a.removeAt(index);});
  }

  List a0 = [1, 3, 3, 4, 5, 6];
  check(a0, true);
  check(a0, 0.1);
  check(a0, "3");
  check(a0, [3]);
}
