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
 * typeList:
 *   type (’, ’ type)*
 * ;
 * @description Checks that it is a compile-time error if the extends clause of an interface is empty.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

interface I extends {
}

class C implements I {
}

main() {
 try {
   I i1=new C();
   assert(i1!=null);
 } catch(var x) {
 }
}

