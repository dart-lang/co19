/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Appends all elements of the collection to the end of list.
 * Extends the length of the list by the length of collection.
 * @description Attempt to call method without parameter.
 * @author vasya
 * @reviewer iefremov
 * @needsreview
 */

main() {
  try {
    new List().addAll();
    Expect.fail("NoSuchMethodException expected");
  } catch(NoSuchMethodException ok) {}
}
