/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the implements clause of an class C
 * includes a type expression that does not denote a class or interface available
 * in the lexical scope of C.
 * @description Checks that it is possible to specify type expression that denotes a class
 * in the implements clause.
 * @author iefremov
 * @needsreview issue 554
 * @reviewer rodionov
 */

class foo {}

class A implements foo {}

main() {
  A a = new A();
  Expect.isTrue(a is foo);
}
