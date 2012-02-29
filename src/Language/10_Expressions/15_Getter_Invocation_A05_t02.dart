/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the static type of e. It is a static type warning if T does not have
 * a getter named m.
 * @description Checks that it is a static type warning if T does not have a setter named m.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */

class C {
}

main()  {
  C o = new C();
  try {
    o.v = 1;
  } catch(var e) {}
}
