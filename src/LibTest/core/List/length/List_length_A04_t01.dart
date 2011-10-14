/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Changes the length of the list. If [newLength] is greater than
 * the current [length], entries are initialized to [null].
 * @description Tries to set negative length.
 * @author vasya
 * @needsreview
 * @reviewer msyabro
 */

main() {
  List a = new List();
  try {
    a.length = -1;
    Expect.fail("IndexOutOfRangeException expected when calling ga.length");
  } catch(IndexOutOfRangeException ok){}
}
