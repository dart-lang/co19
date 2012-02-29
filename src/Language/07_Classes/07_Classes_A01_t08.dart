/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 * abstract? class identifier typeParameters? superclass? interfaces?
 *   '{' classMemberDefinition* '}'
 * ;
 * @compile-error
 * @description Checks that it is a compile-time error if a class type definition
 * with an extends clause is missing both opening and closing curly brackets. 
 * Class body is empty.
 * @author msyabro
 * @reviewer rodionov
 */

class S {}
class A extends S

main() {
  try {
    A a = new A();
  } catch(var e) {}
}