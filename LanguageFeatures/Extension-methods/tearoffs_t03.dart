/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A static extension method can be torn off like an instance method.
 *
 * @description Check that a static extension method can be torn off like an
 * instance method.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";
import "tearoffs2.lib.dart";

main() {
  Expect.equals(3, funcFoo(X([1])));
  Expect.equals(3, funcFoo(X("[1]")));
  Expect.equals(13, funcFoo(X("Lily was here")));

  Expect.equals(":Lily was here", funcBar(""));
  Expect.equals("XXX:Lily was here", funcBar("XXX"));

  Expect.equals(":Run, Forrest, run", funcBar2(""));
  Expect.equals("XXX:Run, Forrest, run", funcBar2("XXX"));
}
