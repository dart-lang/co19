/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An extension is in scope if the name is shadowed by another
 * declaration
 *
 * @description Check that name conflict can be solved by import a library with
 * the prefix
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";
import "scope_all_lib.dart";
import "scope_bar_lib.dart" as b;

main() {
  List<String> list = ["Lily", "was", "here"];
  Expect.equals("bar", Bar(list).bar());
  Expect.equals("staticBar", Bar.staticBar);
  Expect.equals("bar-bar", b.Bar(list).bar());
  Expect.equals("staticBar-Bar", b.Bar.staticBar);
}
