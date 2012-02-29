/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the static type of o. If T.m exists, it is a static type
 * warning if the type F of T.m may not be assigned to a function type.
 * @description Checks that it is a static type warning if T.m can not be assigned to a function type.
 * @static-warning
 * @author msyabro
 */

class C {
  int m;
}

main() {
  C o;
  try {
    o.m();
  } catch(NullPointerException e) {}
}

