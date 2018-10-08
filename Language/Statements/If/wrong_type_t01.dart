/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if the type of the expression b may
 * not be assigned to bool.
 * @description Checks that it is a compile error if the expression
 * cannot be assigned to bool.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */

main() {
  var i;
  if (1) {
    i = 1;
  }
}
