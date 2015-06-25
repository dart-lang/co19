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
 * object by static getter declaration
 *
 * @author sgrekhov
 */
import "../../Utils/expect.dart";

class C {
  int get g1 => 0;
  static get g2 => 1;
}

main() {
  C c = new C();
  Type t = c.runtimeType;

  Expect.throws(() {var x = t.g1;}, (e) => e is NoSuchMethodError);
  Expect.equals(1, t.g2, "Static getter should axist and return expected value");
}
