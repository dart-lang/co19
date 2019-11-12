/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A simple member invocation on a target expression X is an
 * expression of one of the forms:
 * Member invocation on target X	     Corresponding member name
 *        X[expr2]                                   []
 * @description Check explicit extension member invocation in form of X[expr2]
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";

class C {
  String operator [](int index) => "Lily was here:$index";
}

extension Extension1 on C {
  String operator [](int index) => "Show must go on:$index";
}

extension Extension2 on C {
  String operator [](int index) => "Let it be:$index";
}

main() {
  C c = new C();
  Expect.equals("Show must go on:42", Extension1(c)[42]);
  Expect.equals("Let it be:13", Extension2(c)[13]);
  Expect.equals("Lily was here:451", c[451]);
}
