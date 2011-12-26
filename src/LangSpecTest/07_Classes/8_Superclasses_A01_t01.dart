/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The extends clause of a class C specifies its superclass.
 * @description Checks that a class can indeed specify a superclass using the extends clause
 * and an instance of this class is also an instance of that superclass. 
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer rodionov
 */

class A {}

class B extends A {}

main() {
  Expect.isTrue(new B() is A);
}
