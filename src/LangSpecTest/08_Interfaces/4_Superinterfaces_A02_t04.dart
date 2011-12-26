/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the extends clause of an interface I includes
 * a type expression that does not denote a class or interface available in the lexical scope of I. 
 * @description Checks that it is not a compile-time error if the extends clause of an interface includes classes.
 * @author rodionov
 * @reviewer kaigorodov
 * @needsreview issue 554
 */

interface A {}
class C {}
interface I extends A, C {}
class B implements I {}

main() {
  new B();
}

