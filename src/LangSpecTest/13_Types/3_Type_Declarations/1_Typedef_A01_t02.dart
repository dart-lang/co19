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
 * @description Checks that identifier must be present.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

typedef <T>();

main() {
  try {
  } catch(var x){}
}