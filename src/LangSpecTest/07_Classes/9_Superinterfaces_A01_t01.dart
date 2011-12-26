/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class has a set of direct superinterfaces. This set includes the
 * interface of its superclass and the interfaces specified in the the implements
 * clause of the class.
 * interfaces:
 *   implements typeList
 * ;
 * @description Checks that a class can indeed specify one or more superinterfaces using 
 * the implements clause and an instance of this class will also be an instance of those 
 * interfaces as well as any and all of its superclasses' superinterfaces. 
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer rodionov
 */

interface IA {}
class A implements IA {}
interface IB {}
class B extends A implements IB {}
interface IC {}
interface ID {}
class C extends B implements IC, ID {}

main() {
  C c = new C();
  Expect.isTrue(c is IA);
  Expect.isTrue(c is IB);
  Expect.isTrue(c is IC);
  Expect.isTrue(c is ID);
}
