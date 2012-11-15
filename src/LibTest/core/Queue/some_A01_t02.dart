/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if one element of the collection satisfies the
 * predicate [f]. Returns false otherwise.
 * @description Checks the method some() on empty list.
 * @author msyabro
 * @reviewer varlax
 */


main() {
  Queue list = new Queue();
  
  int count = 0;
  bool res = list.some((var element) {
    count++;
    return true;
  });
  
  Expect.isTrue(count == 0);
  Expect.isTrue(res == false);
}
