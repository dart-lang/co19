/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if m is a method and m' is a getter, or
 * if m is a getter and m' is a method.
 * @description Checks that there is a static warning if class has a method
 * and its superinterface has getter with the same name
 * @static-warning
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  int get m => 0;
}

class C implements A {
  int m() {
    return 1;
  }
}

main() {
  C c = new C();
  Expect.equals(1, c.m(), "Method should return correct value");
}
