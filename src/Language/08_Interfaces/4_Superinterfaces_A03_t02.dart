/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the extends clause of an interface includes type Dynamic.
 * @description Checks that it is not a compile-time error if the extends clause of an interface includes
 * type Dynamic as generic interface's type parameter.
 * @author rodionov
 * @reviewer kaigorodov
 */

interface J<T> {}

interface I extends J<Dynamic>  {}

class C implements I {}

main() {
 try {
   I i1=new C();
   assert(i1!=null);
 } catch(var x) {
 }
}
