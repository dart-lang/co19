/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [ArgumentError] if the [length] is negative.
 * @description Checks that ArgumentError is thrown as expected.
 * @author vasya
 * @reviewer iefremov
 * @reviewer msyabro
 * @reviewer varlax
 */

main() {
  try {
    List a = new List(-1);
    Expect.fail("ArgumentError is expected");
  } on ArgumentError catch(e) {}
}
