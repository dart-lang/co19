/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * libraryExport:
 *   metadata export uri combinator* `;'
 * ; 
 * @description Checks that it is a compile-time error when there're no identifiers
 * following a hide combinator in an export declaration.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 * @issue 6127
 */

import "2_Exports_A01_t05_lib.dart";

main() {
  try {
    var x = foo;
  } catch(anything) {}
}
