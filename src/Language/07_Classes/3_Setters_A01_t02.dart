/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * setterSignature:
 * static? returnType? set identifier formalParameterList
 * ;
 * @description Checks that it is a compile-time error if the setter identifier is missing.
 * @compile-error
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer rodionov
 * @needsreview set is a pseudo-keyword. Issue 379
 */

class C {
  set () => null;
}

main() {
  try {
    new C();
  } catch(var x) {}
}
