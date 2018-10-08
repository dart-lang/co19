/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(T element))
 * Returns true if every element of the collection satisfies the predicate [f].
 * Returns false otherwise.
 * @description Checks that this method works as specified with a collection of
 * integers and a simple predicate (numerical comparison).
 * @author pagolubev
 */
library every_A01_t01;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  bool foo(var x) { return x > 0; }

  Set s = create();
  Expect.isTrue(s.every(foo));

  s.addAll([1, 17, 5, 3, 11]);
  Expect.isTrue(s.every(foo));
  Expect.isTrue(s.containsAll([1, 17, 5, 3, 11]));
  Expect.isTrue(s.length == 5);

  s.add(-1);
  Expect.isTrue(!s.every(foo));
  Expect.isTrue(s.containsAll([1, 17, 5, 3, 11, -1]));
  Expect.isTrue(s.length == 6);

  s.remove(-1);
  Expect.isTrue(s.every(foo));
}

main() {
  test(create);
}
