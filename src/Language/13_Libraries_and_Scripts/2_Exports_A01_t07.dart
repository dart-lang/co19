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
 * is used without a library declaration preceding it.
 * @compile-error
 * @author rodionov
 * @issue 6128
 */

export "2_Exports_lib.dart";

main() {
  try {
    var x = foo;
  } catch(anything) {}
}
