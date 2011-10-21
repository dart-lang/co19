/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies the function [f] to each element of the collection
 * @description Tries to change the list from [f] and checks no exception is thrown.
 * @author msyabro
 * @reviewer varlax
 */


main() {
  Queue list = new Queue();
  
  list.addLast(1);
  list.addLast(1);
  list.forEach(void func(var element){ 
    list.clear();
  });
  Expect.isTrue(list.isEmpty());
  
  for(int i = 0; i < 100; i++) {
    list.addLast(i);
  }
  
  list.forEach(void func(var element) {
    list.removeFirst();
  });
  Expect.isTrue(list.isEmpty());
}
