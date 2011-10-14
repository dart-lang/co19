/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds [value] at the end of the list, extending the length by one.
 * @description Attempt to call this method with extra parameter.
 * @author vasya
 * @reviewer iefremov
 * @needsreview
 */

main() {
  try {
    new List().add(0, 1);
    Expect.fail("NoSuchMethodException expected");
  } catch(NoSuchMethodException ok) {}
}
