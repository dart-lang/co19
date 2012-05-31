/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the argument a to a library or resource directive
 * is not a compile-time constant, or if a involves string interpolation.
 * @description Checks that it is a compile-time error if the argument to a library directive
 * involves string interpolation.
 * @compile-error
 * @author msyabro
 */

#library('lib${'rary'}');

main() {
  try {
    var someVar = 0;
  } catch(var e) {}
}
