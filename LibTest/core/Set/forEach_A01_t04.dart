/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(T element))
 * Applies the function [f] to each element of the collection.
 * @description Checks that nested invocations of forEach() do not cause any
 * errors.
 * @author pagolubev
 */
library forEach_A01_t04;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set s = create();
  s.addAll([1, -3, 10, 17]);

  Set outer = create();
  s.forEach((var x) {
    outer.add(x);
    Set inner = create();
    s.forEach((var y) {
      inner.add(y);
    });
    Expect.isTrue(inner.containsAll(s));
  });
  Expect.isTrue(outer.containsAll(s));
}

main() {
  test(create);
}
