/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [NullPointerException] if [collection] is [:null:].
 * @description Checks that the exception is thrown as expected.
 * @author vasya
 * @reviewer iefremov
 * @reviewer varlax
 */

main() {
  try {
    new List().addAll(null);
    Expect.fail("NullPointerException expected when calling a.addAll()");
  } on NullPointerException catch(e) {}

  try {
    [].addAll(null);
    Expect.fail("NullPointerException expected when calling a.addAll()");
  } on NullPointerException catch(e) {}
}
