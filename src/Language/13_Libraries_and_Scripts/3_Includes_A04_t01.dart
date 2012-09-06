/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if value of the URI s is not a compile-time constant,
 * or if s involves string interpolation..
 * @description Checks that it is a compile-time error if value of the URI s is not a compile-time constant.
 * @compile-error
 * @author vasya
 * @reviewer msyabro
 */

#source("source".toString());

main() {
  try {
    var someVar = 0;
  } catch(e) {}
}
