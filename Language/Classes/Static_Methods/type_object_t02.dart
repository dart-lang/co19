/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The effect of a static method declaration in class C is to add an
 * instance method with the same name and signature to the Type object for
 * class C that forwards to the static method.
 * @description Check that the instance method, added to the Type object by
 * static method declaration, is not added to Type object of this class and
 * not added to the Type of the ancestor
 * @author sgrekhov@unipro.ru
 * @issue 23721
 */
import "../../../Utils/expect.dart";

class A {
  static a1() => 1;
  static a2() {
    return 2;
  }
}

class C extends A {
  static s1() => 3;
  static s2() {
    return 4;
  }
}

main() {
  C c = new C();
  dynamic t = c.runtimeType;

  Expect.throws(() {var x = t.a1();}, (e) => e is NoSuchMethodError);
  Expect.throws(() {var x = t.a2();}, (e) => e is NoSuchMethodError);
  Expect.throws(() {var x = t.s1();}, (e) => e is NoSuchMethodError);
  Expect.throws(() {var x = t.s2();}, (e) => e is NoSuchMethodError);
}
