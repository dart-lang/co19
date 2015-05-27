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
 * @description Checks that it is a compile-time error when the list of type
 * arguments in a static type annotation is empty.
 * @author iefremov
 * @reviewer rodionov
 * @compile-error
 */

class Generic<T> {
  Generic() {}
}

main() {
  try {
    Generic <> t;
  } catch(x){}
}
