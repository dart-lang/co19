/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the contents of the URI are not 
 * a valid compilation unit.
 * @description Checks that it is a compile-time error if the contents of the URI
 * are not a valid compilation unit (invalid variable declaration).
 * @compile-error
 * @author vasya
 * @reviewer msyabro
 */

#source("source8.dart");

main() {
  try {
    var someVar = 1;
  } catch(var e) {}
}
