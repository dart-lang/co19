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
 * @description Checks that opening angle bracket is a must.
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
  } catch(var x){}
}
