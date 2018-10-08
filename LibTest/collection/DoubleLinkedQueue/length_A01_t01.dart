/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int length
 * Returns the number of elements in this.
 * @description Checks that method returns size of collection.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue list = new DoubleLinkedQueue();
  Expect.isTrue(list.length == 0);
  
  for(int i = 0; i < 100; i++) {
    list.addLast(i);
    Expect.isTrue(list.length == i + 1);
  }
}
