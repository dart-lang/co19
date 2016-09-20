/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that it is a static type warning if the expression
 * cannot be assigned to bool.
 * @description Checks that it is compile error if the expression
 * cannot be assigned to bool.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */

main() {
  var i;
  if ("true") {
    i = 1;
  }
}
