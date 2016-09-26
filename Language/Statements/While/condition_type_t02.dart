/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if the type of e may not be assigned
 * to bool.
 * @description Checks that it is a compile error if the type of e may not
 * be assigned to bool.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */
main() {
  while (1+2) {
    print("foo");
    break;
  }
}

