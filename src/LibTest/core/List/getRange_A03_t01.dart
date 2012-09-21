/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an [IllegalArgumentException] if [length] is negative.
 * @description Checks that an [IllegalArgumentException] throws if [length] is negative.
 * @author vasya
 * @reviewer varlax
 */

check(list, arg) {
  try {
    list.getRange(0, arg);
    Expect.fail("IllegalArgumentException expected when calling List.getRange()");
  } on IllegalArgumentException catch(ok) {}
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
