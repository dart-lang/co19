/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A simple member invocation on a target expression X is an
 * expression of one of the forms:
 * Member invocation on target X	     Corresponding member name
 *        X[expr2] = expr3                        []=
 * @description Check explicit extension member invocation in form of
 * X[expr2] = expr3
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";

class C {
  String value = "";
  void operator []=(int index, String value) {
    this.value = "C:$value:$index";
  }
}

extension Extension1 on C {
  String operator [](int index) => "Show must go on:$index";
}

main() {
  C c = new C();
  Extension1(c)[42] = "Lily was here";
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
