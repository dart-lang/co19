/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An extension can declare a member with the same (base-)name as a
 * member of the type it is declared on. This does not cause a compile-time
 * conflict, even if the member does not have a compatible signature.
 *
 * @description Check that an extension can declare a member with the same
 * (base-)name as a member of the type it is declared on
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

import "../../Utils/expect.dart";

extension ExtendedList<T> on List<T> {
  static bool called = false;
  void add(T val) {
    called = true;
  }
}

extension ExtendedList2<T> on List<T> {
  static bool called = false;
  void add(T val, {int count = 1}) {
    called = true;
  }
}

main() {
  List<String> list = ["Lily", "was"];
  list.add("here");
  Expect.listEquals(["Lily", "was", "here"], list);
  Expect.isFalse(ExtendedList.called);
  Expect.isFalse(ExtendedList2.called);
}
