/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [Error] if [collection] is [:null:].
 * @description Checks that the exception is thrown as expected.
 * @author vasya
 * @reviewer iefremov
 * @reviewer varlax
 */

main() {
  try {
    new List().addAll(null);
    Expect.fail("Error expected when calling a.addAll()");
  } on Error catch(e) {}

  try {
    [].addAll(null);
    Expect.fail("Error expected when calling a.addAll()");
  } on Error catch(e) {}
}
