/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static type annotation grammar:
 * type:
 * qualified typeArguments?
 * ;
 * typeArguments:
 * '<' typeList '>'
 * ;
 * typeList:
 * type (',' type)*
 * ;
 * @description Checks that a generic type can not be parameterized with non-type (using local variable).
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */

class G<T> {
}

main() {
  int foo;
  G<foo> t;
}
