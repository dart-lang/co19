/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int length
 * @description Checks that [length] is a read-only property and cannot be
 * changed
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

main() {
  dynamic list = toLinkedList([1, 2, 3]);
  Expect.throws(() { list.iterator = null; }, (e) => e is NoSuchMethodError);
}
