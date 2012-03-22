/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An include directive specifies a URI where a Dart compilation unit that should
 * be incorporated into the current library may be found.
 * include:
 * '#' 'source' '(' stringLiteral ')' ';'
 * ;
 * compilationUnit:
 * * topLevelDefinition* EOF
 * ;
 * A compilation unit is a sequence of top level declarations.
 * @description Checks that several compilation units can be included.
 * @author vasya
 * @reviewer msyabro
 */

#source("source.dart");
#source("source3.dart");

main() {
  // get/set
  value = bar;
  Expect.equals(1, value);
  value = false;
  Expect.equals(false, value);
  value = foo;
  Expect.equals("foo", value);
  value = [1,2,3,4];
  Expect.listEquals([1,2,3,4], value);

  // variables
  Expect.isTrue("foo" == foo);
  Expect.isTrue(1 == bar);

  // class
  A a = new A();
  Expect.isTrue(a is A);
}
