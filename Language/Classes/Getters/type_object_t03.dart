/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The effect of a static getter declaration in class C is to add 
 * an instance getter with the same name and signature to the Type object for 
 * class C that forwards to the static getter.
 * @description Check that the instance getter, added to the Type object by 
 * static getter declaration, is not added to the Type object of the current
 * class and not added to the Type object of the ancestor. Test type alias
 * @author sgrekhov@unipro.ru
 * @issue 23721
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

import "dart:core";
import "../../../Utils/expect.dart";

abstract class A<V> {
  int get g1 => 1;
  get g2 => null;
  static get g3 => null;
  static int get g4 => 4;
  V get g5 => null;
}

typedef AAlias<V> = A<V>;

class C<V> extends AAlias<V> {
  static int get g6 => 6;
}

main() {
  C c = new C<String>();
  dynamic t = c.runtimeType;

  Expect.throws(() {t.g1;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {t.g2;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {t.g3;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {t.g4;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {t.g5;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {t.g6;}, (e) => e is NoSuchMethodError);
}