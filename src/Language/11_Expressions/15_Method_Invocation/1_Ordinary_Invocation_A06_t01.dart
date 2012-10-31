/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the static type of o. It is a static type warning if T does not have
 * an accessible instance member named m.
 * @description Checks that it is a static type warning if T does not have an instance member named m.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */

class C {}

main() {
  C o;
  try {
    o.nonExistingMethod();
    Expect.fail("NPE expected");
  } on NullPointerException catch(e) {}
}

