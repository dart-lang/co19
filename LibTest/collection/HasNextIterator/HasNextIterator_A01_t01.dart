/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HasNextIterator(Iterator<E> _iterator)
 * @description Checks that constructor creates an [HasNextIterator] object.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  List list = [1, 2, 3, 4, 5];
  HasNextIterator hnit = new HasNextIterator(list.iterator);
  Expect.isTrue(hnit is HasNextIterator);

  hnit = new HasNextIterator(null);
  Expect.isTrue(hnit is HasNextIterator);
}
