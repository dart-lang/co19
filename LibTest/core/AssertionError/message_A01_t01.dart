/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Object message;
 * Message describing the assertion error
 * @description Checks that this property returns correct value
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

check(message) {
  AssertionError ae = new AssertionError(message);
  Expect.equals(message, ae.message);

  bool thrown = false;
  try {
    assert(false, message);
  } on AssertionError catch (e) {
    Expect.equals(message, e.message);
    thrown = true;
  }
  Expect.isTrue(thrown);
}

main() {
  check(null);
  check("I'll be back!");
  check(123);
  check(3.14);
  check(true);
  check(false);
  check(new Object());
}
