/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(T element))
 * Returns true if every element of the collection satisfies the predicate [f].
 * Returns false otherwise.
 * @description Checks that invoking every() doesn't change the set by itself.
 * @author msyabro
 */
library every_A01_t03;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  bool foo(var x) { return x > 0; }
  Set s = create();
  s.addAll([-1, -3, -11]);
  Expect.isTrue(!s.every(foo));

  Expect.isTrue(s.length == 3);
  Expect.isTrue(s.containsAll([-1, -3, -11]));
}

main() {
  test(create);
}
