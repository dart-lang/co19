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
 * @description Checks that it is a compile-time error when export declaration
 * includes an 'as prefix' clause.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

import "syntax_t06_lib.dart";

main() {
  try {
    var x = foo;
  } catch(anything) {}
}
