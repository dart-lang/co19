/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void addAll(Iterable<E> elements)
 * Adds all of elements to this Set.
 * @description Passes a list containing null to addAll(), expects no errors.
 * @author pagolubev
 * @author sgrekhov@unipro.ru
 */
library addAll_A01_t02;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set s = create();

  s.addAll([null]);
  Expect.equals(1, s.length);
  s.addAll([1, 2, null]);
  Expect.equals(3, s.length);
}

main() {
  test(create);
}
