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
 * @description Check that it is no compile error if an extension declares a
 * member with the same (base-)name as a member of the type it is declared on
 * but with the different arguments (but it is a compile error if we try to call
 * it)
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

extension ExtendedList<T> on List<T> {
  void add(T val, {int count = 1}) {
  }
}

main() {
  List<String> list = ["Lily", "was"];
  list.add("here", count: 2);           //# 01: compile-time error
}
