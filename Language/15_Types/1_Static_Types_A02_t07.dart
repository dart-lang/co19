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
 * @description Checks that a generic type can not be parameterized with non-type (using null).
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

class G<T> {
  G() {}
}

main() {
  try {
    G<null> t;
  } catch(x){}
}
