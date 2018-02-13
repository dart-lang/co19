/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(T element))
 * Returns true if every element of the collection satisfies the predicate [f].
 * Returns false otherwise.
 * @description Checks that nested invocations of every() on the same set do not
 * cause any errors.
 * @author pagolubev
 */
library every_A01_t02;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set s = create();
  s.addAll([1, -3, 10, 17]);

  Set outer = create();
  s.every((var x) {
    outer.add(x);
    Set inner = create();
    s.every((var y) {
      inner.add(y);
      return true;
    });
    Expect.isTrue(inner.containsAll(s));
    return true;
  });
  Expect.isTrue(outer.containsAll(s));
}

main() {
  test(create);
}
