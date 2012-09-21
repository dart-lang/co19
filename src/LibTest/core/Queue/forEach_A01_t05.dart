/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies the function [f] to each element of the collection.
 * @description Checks that exception thrown in [f] breaks the iteration.
 * @author msyabro
 * @reviewer varlax
 */


main() {
  Queue list = new Queue();
  
  list.addLast(1);
  list.addLast(2);
  
  int count = 0;
  try {
    list.forEach(void func(var element) {
      throw ++count;
    });
  } on Object catch(e) {
    Expect.equals(1, count);
  }
}
