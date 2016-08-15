/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion constructorSignature:
 *   identifier (‘.’ identifier)? formalParameterList
 * ;
 * @description Checks that constructor name cannot contain 3 identifiers.
 * @compile-error
 * @author kaigorodov
 */

class C {
  C.c1.c2();
  C.c3() {}
}


main() {
  try {
    new C.c3();
  } catch (x) {}
}
