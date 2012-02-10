/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface may contain getter and/or setter signatures.
 * These are subject to the same compile-time and static checking rules 
 * as getters and setters in classes.
 * 7.3: It is a static warning if a setter declares a return type other than void.
 * @description Check that it is a static warning if a setter declares a return type other than void.
 * @static-warning
 * @author vasya
 * @reviewer rodionov
 */

interface I  {
  Dynamic set s(int foo);
}

class A implements I {}

main() {
  I i1=new A();
}

