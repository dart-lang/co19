/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A simple member invocation on a target expression X is an
 * expression of one of the forms:
 * Member invocation on target X	     Corresponding member name
 *   X.id = expr2	                                  id=
 * @description Check explicit extension member invocation in form of
 * X.id = expr2
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";

class C {
  String value = "Who was here?";

  void set id(String val) {
    this.value += " Me " + val;
  }
}

extension Extension1 on C {
  void set id(String val) {
    this.value += " Lily " + val;
  }
}

extension Extension2 on C {
  void set id(String val) {
    this.value += " Nobody " + val;
  }
}

main() {
  C c1 = new C();
  Extension1(c1).id = "was here";
  Expect.equals("Who was here? Lily was here", c1.value);
  C c2 = new C();
  Extension2(c2).id = "was here";
  Expect.equals("Who was here? Nobody was here", c2.value);
  C c3 = new C();
  c3.id = "was here";
  Expect.equals("Who was here? Me was here", c3.value);
}
