/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable<E> getRange(int start, int end)
 * It is an error if end is before start.
 * @description Checks that an error is thrown if end is before start.
 * @author vasya
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

check(list, arg) {
  try {
    list.getRange(0, arg);
    Expect.fail("ArgumentError expected when calling List.getRange()");
  } on ArgumentError catch(ok) {}
}

main() {
  check(new List(1), -1);
  check(new List(1), -(1<<65));
  check([1], -1);
  check([1], -(1<<65));
  check(const [1], -1);
  check(const [1], -(1<<65));
  check(new List(), -1);
  check(new List(), -(1<<65));

}
