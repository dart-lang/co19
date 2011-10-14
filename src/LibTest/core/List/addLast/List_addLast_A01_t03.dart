/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds [value] at the end of the list, extending the length by one.
 * @description Tries to call this method without parameter.
 * @author vasya
 * @needsreview
 * @reviewer msyabro
 */

main() {
  List a = new List();
  try {
    a.addLast();
    Expect.fail("NoSuchMethodException is expected");
  } catch(NoSuchMethodException e) {}
}
