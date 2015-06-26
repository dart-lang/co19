/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The effect of a static getter declaration in
 * class C is to add an instance getter with the same name and signature to the
 * Type object for class C that forwards to the static getter.
 * @description Check that the instance getter, added to the Type object by static
 * getter declaration, added to the Type object of the current class only and
 * not added to the Type object of the ancestor
 * @author sgrekhov@unipro.ru
 * @issue 23721
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

  Expect.throws(() {var x = t.g1;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {var x = t.g2;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {var x = t.g3;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {var x = t.g4;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {var x = t.g5;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {var x = t.g6;}, (e) => e is NoSuchMethodError);

  Expect.equals("", t.g7, "Static getter should return expected value");
  Expect.equals(8, t.g8, "Static getter should return expected value");
}