/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Typedef grammar:
 * functionTypeAlias:
 *   typedef functionPrefix typeParameters? formalParameterList ’;’
 * ;
 * functionPrefix:
 *   returnType? identifier
 * ;
 * @description Checks that formalParameterList in the typedef declaration cannot include a semicolon.
 * @compile-error
 * @author kaigorodov
 * @reviewer iefremov
 */

typedef f<T1; T2>();

main() {
  try {
    Expect.isTrue(null is f);
  } catch(x){}
}
