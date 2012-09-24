/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if the type of e may not be assigned to bool.
 * @description Checks that it is a static type warning if the type of e may not be assigned to bool.
 * @author rodionov
 * @reviewer iefremov
 * @static-warning
 */

int f() {return 1;}

main() {
  try {
    while (f()) {
      print("foo");
      break;
    } 
  } on TypeError catch(ok) {}
}

