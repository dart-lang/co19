/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion constructorSignature:
 *   identifier (‘.’ identifier)? formalParameterList
 * ;
 * @description Checks valid constructor declarations.
 * @author vasya
 */

class C {
  C(String s, var x, [Object o, var z = const []]);
  C.c1();
  C.c2(String s, var x, [Object o, var z = const []]) {}
}


main() {
  new C("", null, 1);
  new C.c1();
  new C.c2("", null, 1);
}
