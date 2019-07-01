/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An extension is in scope if the name is shadowed by another
 * declaration
 *
 * @description Check that if there is no naming conflict then extension is in
 * scope
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";
import "scope_all_lib.dart";
import "scope_bar_lib.dart";

main() {
  List<String> list = ["Lily", "was", "here"];
  Expect.equals("baz", list.baz());
  Expect.equals("staticBaz", Baz.staticBaz);
}
