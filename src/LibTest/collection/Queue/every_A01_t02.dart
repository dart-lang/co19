/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if every elements of the collection satisfy the
 * predicate [f]. Returns false otherwise.
 * @description Checks every() on empty list returns true.
 * @author msyabro
 * @reviewer varlax
 */
import "dart:collection";

main() {
  Queue list = new Queue();
  
  int count = 0;
  bool res = list.every((var element) {
    count++;
    return false;
  });
  
  Expect.isTrue(count == 0);
  Expect.isTrue(res == true);
}
