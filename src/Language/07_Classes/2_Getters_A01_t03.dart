/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * getterSignature:
 * static? returnType? get identifier formalParameterList
 * ;
 * @description Checks that it is a compile-time error if the getter parameter list is missing.
 * @author iefremov
 * @compile-error
 * @reviewer pagolubev
 */

class C {
  get getter => null;
}

main() {
  try {
    new C().getter;
  } catch(var x){}
}

