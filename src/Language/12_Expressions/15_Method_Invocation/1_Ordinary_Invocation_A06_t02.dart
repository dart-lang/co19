/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the static type of o. It is a static type warning if T does not have
 * an accessible instance member named m.
 * @description Checks that it is a static type warning if member m exists in T 
 * but is inaccessible.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 * @needsreview issue 3266, issue 3267
 */
import "../../../Utils/expect.dart";

import "lib.dart";

//library code

// library lib;
//
// class C {
//   _func() {}
// }


main() {
  C o;
  try {
    o._func(); /// static type warning
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(e) {}
}
