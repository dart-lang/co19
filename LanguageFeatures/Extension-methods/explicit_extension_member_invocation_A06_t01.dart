/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A simple member invocation on a target expression X is an
 * expression of one of the forms:
 * Member invocation on target X	     Corresponding member name
 *   X.id(args)                                  id
 * @description Check explicit extension member invocation in form of
 * X.id(args)
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";

class C {
  String id(String val) => "Let it be. " + val;
}

extension Extension1 on C {
  String id(String val) => "Lily was here. " + val;
}

extension Extension2 on C {
  String id(String val) => "Show must go on. " + val;
}

main() {
  C c = new C();
  Expect.equals("Lily was here. Dave Stewart", Extension1(c).id("Dave Stewart"));
  Expect.equals("Show must go on. Queen", Extension2(c).id("Queen"));
  Expect.equals("Let it be. Beatles", c.id("Beatles"));
}
