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
  void operator []=(int index, String value) {
    this.value = "Extension1:$value:$index";
  }
}

extension Extension2 on C {
  void operator []=(int index, String value) {
    this.value = "Extension2:$value:$index";
  }
}

main() {
  C c = new C();
  Extension1(c)[42] = "Lily was here";
  Expect.equals("Extension1:Lily was here:42", c.value);
  Extension2(c)[41] = "Show must go on";
  Expect.equals("Extension2:Show must go on:41", c.value);
  c[40] = "Let it be";
  Expect.equals("C:Let it be:40", c.value);
}
