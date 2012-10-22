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
 * @description Checks that it is not a compile-time error when the library being
 * exported does not have a library definition.
 * @author rodionov
 * @issue 6129
 */

library Exports_A01_t15;
export "2_Exports_A01_t15_lib.dart";

main() {
  var x;
}
