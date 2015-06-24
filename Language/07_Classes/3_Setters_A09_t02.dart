/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion getter definition that is prefixed with the static modifier defines a static
 * getter. Otherwise, it defines an instance getter. The name of the getter is given
 * by the identifier in the definition. The effect of a static getter declaration in
 * class C is to add an instance getter with the same name and signature to the
 * Type object for class C that forwards to the static getter.
 * @description Check that the instance getter with the same name added to the Type
 * object by static setter declaration is not inherited
 *
 * @author sgrekhov
 */
import "dart:core";
import "../../Utils/expect.dart";

abstract class A<V> {
  set s1(int value) => {};
  static set s2(int value) => {};
  static int set s3(int value) {return 3;}
  V set s4(V value) => {};
  static set s6(V value) => {};
  static V set s7(V value) {return null;}
}

class C<V> extends A<V> {
  static int _s9;
  static V set s7(V value) {return new V();}
  static int set s8(int value) {return 8;}
  static set s9(int value) => _s9 = value;
}

main() {
  C c = new C<String>();
  Type t = c.runtimeType;

  try {
    var x = t.g1;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (ok) {}

  try {
    var x = t.g2;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (ok) {}

  try {
    var x = t.g3;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (ok) {}

  try {
    var x = t.g4;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (ok) {}

  try {
    var x = t.g5;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (ok) {}

  try {
    var x = t.g6;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (ok) {}

  Expect.equals("", t.s7 = "string", "Static setter should return expected value");
  Expect.equals(8, t.s8 = 0, "Static setter should return expected value");
  t.s9 = -1;
  Expect.equals(-1, C._s9, "Static setter should set expected value");
}