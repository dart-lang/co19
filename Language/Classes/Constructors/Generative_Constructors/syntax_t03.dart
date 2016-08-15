/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion constructorSignature:
 *   identifier (‘.’ identifier)? formalParameterList
 * ;
 * @description Checks that omitting a named constructor's identifier results
 * in a compile-time error.
 * @compile-error
 * @author pagolubev
 */

class C {
  C.();
}

main() {
  try {
    var c = new C();
  } catch (x) {}
}
