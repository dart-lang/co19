/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion stringLiteral:
 *   '@'? MULTI_LINE_STRING
 *   | SINGLE_LINE_STRING
 * ;
 * MULTI_LINE_STRING:
 *   '"""'  (~ '"""')* '"""'
 *   | ''''' (~ ''''')* '''''
 * ;
 * @description Checks that it is a compile-time error when a raw multi-line
 * single-quotes string literal does not have the opening triplet.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  try {
    @ incorrect string''';
  } catch(var e) {}
}
