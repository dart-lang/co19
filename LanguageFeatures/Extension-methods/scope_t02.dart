/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An extension is in scope if the name is shadowed by another
 * declaration
 *
 * @description Check that it is a compile error if extensions have name
 * conflict
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "scope_all_lib.dart";
import "scope_bar_lib.dart";

main() {
  List<String> list = ["Lily", "was", "here"];
  Bar(list).bar();      //# 01: compile-time error
  Bar.staticBar;        //# 02: compile-time error
}
