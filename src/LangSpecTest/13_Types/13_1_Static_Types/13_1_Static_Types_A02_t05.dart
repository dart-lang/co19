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
 * @description Checks that the list of type arguments must be comma-separated.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

class G<A, B> {
  G() {}
}

main() {
  G<int double> g;
}
