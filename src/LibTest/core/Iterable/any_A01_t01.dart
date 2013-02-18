/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool any(bool f(E element))
 * Returns true if one element of the collection satisfies the predicate [f].
 * Returns false otherwise.
 * @description Checks that this method works as specified on sets.
 * @author pagolubev
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";


main() {
  bool foo(int x) { return x > 0; }

  Set<int> s = new Set<int>();
  Expect.isTrue(!s.any(foo));

  s.addAll([-1, -3, -11]);
  Expect.isTrue(!s.any(foo));

  s.add(5);
  Expect.isTrue(s.any(foo));

  s.add(3);
  Expect.isTrue(s.any(foo));

  s.removeAll([3, 5]);
  Expect.isTrue(!s.any(foo));
}
