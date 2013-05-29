/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E first
 * Returns the first element.
 * If this is empty throws a StateError.
 * @description Checks that a StateError is thrown when this is empty.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

check(List a) {
  try {
    a.first;
    Expect.fail("StateError expected when calling a.first");
  } on StateError catch(ok) {}
}

main() {
  check(new List());
  check([]);
  check(const[]);
  check(new List.from([]));
}
