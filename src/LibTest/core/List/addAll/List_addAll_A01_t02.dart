/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Appends all elements of the collection to the end of list.
 * Extends the length of the list by the length of collection.
 * @description Attempt to call this method with null parameter.
 * @author vasya
 * @reviewer iefremov
 * @needsreview undocumented exception
 */

main() {
  try {
    new List().addAll(null);
    Expect.fail("NullPointerException expected when calling a.addAll()");
  } catch(NullPointerException e) {}
}
