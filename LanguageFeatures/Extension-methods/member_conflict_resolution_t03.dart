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
 * @description Check that it is a NoSuchMethodError if an extension declares a
 * member with the same (base-)name as a member of the type it is declared on
 * but with the different arguments
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

import "../../Utils/expect.dart";

extension ExtendedList<T> on List<T> {
  static bool called = false;
  void add(T val, {int count = 1}) {
    called = true;
  }
}

main() {
  dynamic list = ["Lily", "was"];
  Expect.throws(() {
    list.add("here", count: 2);
  }, (e) {return e is NoSuchMethodError;});
}
