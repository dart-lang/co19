/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion constructorSignature:
 * identifier formalParameterList | namedConstructorSignature  ;
 * namedConstructorSignature:  identifier '.' identifier formalParameterList ;
 * @description Checks that constructor name cannot contain 3 identifiers.
 * @compile-error
 * @author kaigorodov
 * @reviewer iefremov
 */

class C {
  C.c1.c2();
}


main() {
  try {
    new C.c1.c2();
  } catch (x) {}
}
