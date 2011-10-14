/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Pops and returns the last element of the list.
 * @description Tries to pop the last element of an empty list.
 * @author vasya
 * @reviewer msyabro
 * @needsreview undocumented
 */

main() {
  List a = new List();
  try {
    a.removeLast();
    Expect.fail("IndexOutOfRangeException expected when calling a.removeLast()");
  } catch( IndexOutOfRangeException ok ) {}
}
