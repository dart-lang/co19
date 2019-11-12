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

class C {
  String value = "Who was here?";

  void set id2(String val) {
    this.value += " Me " + val;
  }
}

extension Extension1 on C {
  void set id(String val) {
    this.value += " Lily " + val;
  }
}

main() {
  C c1 = new C();
  Extension1(c1).id2 = "was here";
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
