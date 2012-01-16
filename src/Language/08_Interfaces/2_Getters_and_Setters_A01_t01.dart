/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface may contain getter and/or setter signatures.
 * @description Checks that an interface may contains both getters and setters.
 * @author vasya
 * @reviewer kaigorodov
 */

class A implements I2 {
  A() {}
  bool vBool;
  int vInt;
  A vA;
  I1 vI1;
  List vArray;
  I2 vI2;
  Dynamic dynamic;
}

interface I1 {
}

interface I2  {
  bool get vBool();
  int get vInt();
  A get vA();
  I1 get vI1();
  List get vArray();
  I2 get vI2();
  get dynamic();

  void set vBool(bool val);
  void set vInt(int val);
  void set vA(A val);
  void set vI1(I1 val);
  void set vArray(List val);
  void set dynamic(var val);
}

main() {
  I2 i1=new A();
  I2 i2=new A();
  Expect.isTrue(i1 != i2);
}



