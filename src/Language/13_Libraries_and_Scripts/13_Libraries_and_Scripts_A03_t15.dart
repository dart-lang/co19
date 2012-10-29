/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion libraryName:
 *   metadata library identifier `;'
 * ;
 * @description Checks that it is a compile-time error if the library name
 * is not a valid identifier (starts with a digit).
 * @compile-error
 * @author rodionov
 */

import "13_Libraries_and_Scripts_A03_t15_lib.dart";

main() {
  try {
    var someVar = 1;
  } catch(e) {}
}
