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
 * object by static getter declaration is not inherited
 *
 * @author sgrekhov
 */
import "dart:core";
import "../../Utils/expect.dart";

abstract class A<V> {
  int get g1 => 1;
  get g2 => null;
  static get g3 => null;
  static int get g4 => 4;
  V get g5 => new V();
  static V get g6 => new V();
  static V get g7 => null;
}

class C<V> extends A<V> {
  static V get g7 => new V();
  static int get g8 => 8;
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

  Expect.equals("", t.g7, "Static getter should return expected value");
  Expect.equals(8, t.g8, "Static getter should return expected value");
}