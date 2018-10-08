/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The effect of a static method declaration in class C is to add an
 * instance method with the same name and signature to the Type object for
 * class C that forwards to the static method.
 * @description Check that static method declaration doesn't add the instance
 * method with the same name to the Type object of this class
 * @author sgrekhov@unipro.ru
 * @issue 23721
 */
import "../../../Utils/expect.dart";

class C {
  int m() => 0;
  static s1() => 1;
  static s2() {
    return null;
  }
}

main() {
  C c = new C();
  dynamic t = c.runtimeType;

  Expect.throws(() {var x = t.m();}, (e) => e is NoSuchMethodError);
  Expect.throws(() {var x = t.s1();}, (e) => e is NoSuchMethodError);
  Expect.throws(() {var x = t.s2();}, (e) => e is NoSuchMethodError);
}
