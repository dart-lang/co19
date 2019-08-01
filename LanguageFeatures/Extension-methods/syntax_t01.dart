/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion an extension declaration is a top-level declaration with a grammar
 * similar to:
 * <extension> ::=
 *   `extension' <identifier>? <typeParameters>? `on' <type> `?'? `{'
 *     memberDeclaration*
 *   `}'
 * Such a declaration introduces its name (the identifier) into the surrounding
 * scope
 *
 * @description Check correct syntax of top-level extension declaration
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

import "../../Utils/expect.dart";

extension MyFancyList<T> on List<T> {
  int get doubleLength => this.length * 2;
  List<T> operator-() => this.reversed.toList();
  List<List<T>> split(int at) => <List<T>>[this.sublist(0, at), this.sublist(at)];
  static String get className => "List";
}

main() {
  List<String> list = ["Lily", "was", "here"];
  Expect.equals(6, list.doubleLength);
  Expect.listEquals([["Lily"], ["was", "here"]], list.split(1));
  Expect.listEquals(["here", "was", "Lily"], -list);
  Expect.equals("List", MyFancyList.className);
}
