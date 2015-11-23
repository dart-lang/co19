/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A list literal denotes a list, which is an integer indexed
 * collection of objects.
 * listLiteral:
 *   const? typeArguments? '[' (expressionList ','?)? ']'
 * ;
 * @description Checks that it is a compile-time error if a const list literal
 * does not start with '['.
 * @author kaigorodov
 * @reviewer iefremov
 * @compile-error
 */

main() {
  try {
    var x = const 1, 2, 3];
  } catch (e) {}
}
