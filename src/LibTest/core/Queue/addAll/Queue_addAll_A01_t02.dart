/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds all elements of [collection] at the end of the list. The
 *            length of the list is extended by the length of [collection].
 * @description Tries to call the method with null parameter.
 * @author msyabro
 * @needsreview undocumented exception
 */

main() {
  try {
    new Queue().addAll(null);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
}
