/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static type annotation grammar:
 * type:
 *   typeName typeArguments?
 * ;
 * typeName:
 *   qualified
 * ;
 * typeArguments:
 *   '<' typeList '>'
 * ;
 * typeList:
 *   type (',' type)*
 * ;
 * @description Checks that it is a compile-time error when the opening angle bracket
 * in a static type annotation's type argument list is missing.
 * @author iefremov
 * @reviewer rodionov
 * @compile-error
 */

class Generic<T> {
  Generic() {}
}

main() {
  try {
  Generic int> t;
  } catch(x){}
}
