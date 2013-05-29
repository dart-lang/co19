/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E last
 * If this is empty throws a StateError.
 * @description Checks that StateError is thrown if the list is empty.
 * @author vasya
 * @reviewer msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

check(List a) {
  try {
    a.last;
    Expect.fail("StateError expected when calling a.last");
  } on StateError catch(ok) {}
}

main() {
  check(new List());
  check([]);
  check(const[]);
  check(new List.from([]));
}
