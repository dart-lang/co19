/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Iterator<E> iterator
 * Provides an iterator that iterates over the elements in insertion order.
 * @description Checks that [iterator] is read-only property and cannot be
 * changed
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  dynamic set = new LinkedHashSet();
  Expect.throws(() { set.iterator = null; }, (e) => e is NoSuchMethodError);
}
