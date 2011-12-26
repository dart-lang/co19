/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface has a set of direct superinterfaces. This set consists of the interfaces
 * specified in the extends clause of the interface.
 * superinterfaces:
 *   extends typeList
 * ;
 * @description Checks that it is a compile-time error if the chain of superinterfaces forms a circular dependency.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 * @reviewer kaigorodov
 */

interface C extends A {}
interface B extends C {}
interface A extends B {}

class D implements A {}

main() {
  try {
    new D();
  } catch(var e) {}
}

