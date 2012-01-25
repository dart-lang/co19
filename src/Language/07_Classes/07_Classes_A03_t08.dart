/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 * class identifier typeParameters? superclass? interfaces?
 *   '{' classMemberDefinition* '}'
 * ;
 * classMemberDefinition:
 *   declaration ';' |
 *   methodSignature functionBody
 * ;
 * methodSignature:
 *   factoryConstructorSignature |
 *   static functionSignature |
 *   getterSignature |
 *   setterSignature |
 *   operatorSignature |
 *   functionSignature initializers? |
 *   namedConstructorSignature initializers?
 * ;
 * @description Checks that a named constructor with initializers can declared without a body.
 * @author msyabro
 * @reviewer rodionov
 * @reviewer iefremov
 * @needsreview issue 497
 */

class A {
  A.B(): x = 1;
  var x;
}

main() {
  A a = new A.B();
  Expect.equals(1, a.x);
}