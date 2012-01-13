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

main() {
  List l = new List(1);
  try {
    l.getRange(0, -1);
    Expect.fail("IllegalArgumentException expected when calling List.getRange()");
  } catch(IllegalArgumentException ok) {}
}
