/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 * metadata abstract? class identifier typeParameters? superclass? interfaces?
 *   '{' classMemberDefinition* '}'
 * ;
 * @compile-error
 * @description Checks that it is a compile-time error if a class type definition
 * uses different styles of opening and closing brackets. 
 * Class body is not empty.
 * @author rodionov
 * @reviewer kaigorodov
 */

class A (
  var someMember;
}

main() {
  try {
    A a = new A();
  } catch (e) {}
}
