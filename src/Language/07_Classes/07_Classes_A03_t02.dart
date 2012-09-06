/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 * metadata abstract? class identifier typeParameters? superclass? interfaces?
 *   ‘{’ classMemberDefinition* ‘}’
 * ;
 * classMemberDefinition:
 *   metadata declaration ‘;’ |
 *   metadata methodSignature functionBody
 * ;
 * methodSignature:
 *   factoryConstructorSignature
 *   | static? functionSignature
 *   | getterSignature
 *   | setterSignature
 *   | operatorSignature
 *   | constructorSignature initializers?
 * ;
 * @description Checks that it is a compile-time error if a factory constructor
 * method definition does not include a body.
 * @reviewer rodionov
 * @compile-error
 * @author msyabro
 */

interface I default A {
  I();
}

class A {
  factory I();
}

main() {
  try {
    I i = new I();
  } catch (e) {}
}
