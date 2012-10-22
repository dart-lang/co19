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
 * @description Checks that it is a compile-time error if export token is prefixed with a '#' character.
 * @compile-error
 * @author rodionov
 */

import "2_Exports_A01_t01_lib.dart";

main() {
  try {
    var x = foo;
  } catch(anything) {
  }
}
