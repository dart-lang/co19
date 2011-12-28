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
 * @description Checks that the typedef declaration cannot include function body.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

typedef f() {};

main() {
  try {
    Expect.isFalse(null is f);
  } catch(var x){}
}