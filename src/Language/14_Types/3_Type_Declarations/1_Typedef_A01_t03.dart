/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Typedef grammar:
 * functionTypeAlias:
 *   metadata typedef functionPrefix typeParameters? formalParameterList ’;’
 * ;
 * functionPrefix:
 *   returnType? identifier
 * ;
 * @description Checks that it is a compile-time error if the terminating semicolon is missing
 * from a type alias declaration.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

typedef void f<T>()

main() {
  try {
    Expect.isFalse(null is f);
  } catch(x){}
}
