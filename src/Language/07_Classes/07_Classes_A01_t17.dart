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
 * @description Checks that it is a compile-time error if an abstract class type definition
 * is missing both opening and closing curly brackets.
 * Class body is empty.
 * @compile-error
 * @author msyabro
 */

abstract class A

main() {
  try {
    A a = new A();
  } catch(var e) {}
}