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
 * is enclosed in triple single quotes.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

import "13_Libraries_and_Scripts_A03_t13_lib.dart";

main() {
  try {
    var someVar = 1;
  } catch(e) {}
}
