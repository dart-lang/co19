/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the last element of the list.
 * @description Tries to call this method with an extra parameter.
 * @author vasya
 * @needsreview
 * @reviewer msyabro
 */

main() {
  List a = new List();
  a.add(0);
  try {
    a.last(null);
    Expect.fail("NoSuchMethodException is expected");
  } catch(NoSuchMethodException e) {}
}
