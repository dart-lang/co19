/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 * metadata abstract? class identifier typeParameters? (superclass mixins?)? interfaces?
 *   '{' (metadata classMemberDefinition)* '}'
 * ;
 * classMemberDefinition:
 *   declaration ';' |
 *   methodSignature functionBody
 * ;
 * methodSignature:
 *   constructorSignature initializers? |
 *   factoryConstructorSignature |
 *   static? functionSignature |
 *   static? getterSignature |
 *   static? setterSignature |
 *   operatorSignature
 * ;
 * @description Checks that there is no compile-time error if an operator
 * method definition in a concrete class does not include a body, and no
 * runtime error is thrown when that class is instantiated.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 */

class A { /// static type warning Abstract Instance Members: It is a static warning if an abstract member is declared or inherited in a concrete class.
  operator==(A other);
}

main() {
  A a = new A();
}
