/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E lookup(Object object)
 * If an object equal to object is in the set, return it.
 * Checks if there is an object in the set that is equal to object. If so, that
 * object is returned, otherwise returns null.
 * @description Checks that it returns
 * @author sgrekhov@unipro.ru
 */
library lookup_A01_t01;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Iterable content])) {
  Set set = create([-1, 0, 1, 2, 3, 4, 5, 6]);

  Expect.equals(0, set.lookup(0));
  Expect.isNull(set.lookup(-2));
  Expect.isNull(set.lookup(0.5));
}

main() {
  test(create);
}
