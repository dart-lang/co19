/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In all cases, iff the variable declaration is prefixed with either the const
 * or the final modifier, the variable is marked as final.
 * @description Checks that if the variable declaration is prefixed with the
 * const modifier, then variable must be initialized right there and then.
 * @compile-error
 * @author msyabro
 */

main() {
  try {
    const id;
  } catch(var e) {}
}
