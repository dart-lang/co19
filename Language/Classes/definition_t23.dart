/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 *   metadata abstract? class identifier typeParameters? (superclass mixins?)? 
 * interfaces? ‘{’ (metadata classMemberDefinition)* ‘}’ |
 *   metadata abstract? class mixinApplicationClass
 * ;
 * @description Checks that various class definitions that are valid according 
 * to 'metadata abstract? class mixinApplicationClass' syntax do not cause any 
 * errors and can be instantiated.
 * @author ngl@unipro.ru
 */

@A() abstract class I1<T> = A1 with B1;
abstract class J1<T> = A1 with B1;
@B() class X1<T> = B1 with A1;
class Y1<T> = B1 with A1;

@A() abstract class I2 = A1 with B1;
abstract class J2 = A1 with B1;
@B() class X2 = A1 with B1;
class Y2 = A1 with B1;

@B() class X3<T> = B1 with A1 implements A1;
class Y3<T> = B1 with A1 implements A1;

abstract class A1 {}
class B1 {}

@B.fromInt(1) class A {
  const A();
}

@B.fromInt(1) class B extends A {
  const B();
  const B.fromInt(int a);
}

main() {
  X1 x1 = new X1();
  Y1 y1 = new Y1();
  
  X2 x2 = new X2();
  Y2 y2 = new Y2();
  
  X3 x3 = new X3();
  Y3 y3 = new Y3();
}
