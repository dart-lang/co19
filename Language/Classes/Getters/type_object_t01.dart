/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise, i is a getter invocation. Let f be the result of looking
 * up getter m in o with respect to L. If o is an instance of Type but e is not
 * a constant type literal, then if f is a getter that forwards to a static
 * getter, getter lookup fails
 * @description Check that static getter declaration doesn't add the instance
 * getter with the same name to the Type object of this class
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
  dynamic t = c.runtimeType;

  Expect.throws(() {var x = t.g1;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {var x = t.g2;}, (e) => e is NoSuchMethodError);
}
