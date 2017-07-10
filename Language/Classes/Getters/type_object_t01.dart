/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The effect of a static getter declaration in class C is to add 
 * an instance getter with the same name and signature to the Type object for 
 * class C that forwards to the static getter.
 * @description Check that static getter declaration doesn/t add the instance
 * getter with the same name to the Type object of this class
 * See https://github.com/dart-lang/sdk/issues/23721
 * @author sgrekhov@unipro.ru
 * @issue 23721
 */
import "../../../Utils/expect.dart";

class C {
  int get g1 => 0;
  static get g2 => 1;
}

main() {
  C c = new C();
  Type t = c.runtimeType;

  Expect.throws(() {var x = t.g1;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {var x = t.g2;}, (e) => e is NoSuchMethodError);
}
