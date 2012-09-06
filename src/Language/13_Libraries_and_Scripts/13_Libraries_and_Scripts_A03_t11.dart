/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion libraryName:
 *   metadata library qualified `;'
 * ;
 * @description Checks that it is a compile-time error if the library name is enclosed
 * in angle brackets.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

import "13_Libraries_and_Scripts_A03_t11_lib.dart";

main() {
  try {
    var someVar = 0;
  } catch(e) {}
}
