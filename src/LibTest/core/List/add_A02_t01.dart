/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws UnsupportedOperationException if the list is not extendable.
 * @description Checks that UnsupportedOperationException exception is thrown
 * if the list is not extendable.
 * @author vasya
 * @reviewer iefremov
 * @reviewer varlax
 */

main() {
  try {
    new List(0).add(null);
    Expect.fail("UnsupportedOperationException expected when calling a.add()");
  } catch(UnsupportedOperationException ok) {}

  try {
    new List(100).add(null);
    Expect.fail("UnsupportedOperationException expected when calling a.add()");
  } catch(UnsupportedOperationException ok) {}
}
