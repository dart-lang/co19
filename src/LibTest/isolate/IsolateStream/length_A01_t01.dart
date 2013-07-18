/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future<int> length
 * Counts the elements in the stream. 
 * @description Checks that correct number of elements is returned.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(Iterable<int> data, bool expected) {
  MessageBox mbox=new MessageBox();
  for (var element in data) {
    mbox.sink.add(element);
  }
  mbox.sink.close();
  
  asyncStart();
  mbox.stream.length.then((value){
    Expect.equals(expected, value);
    asyncEnd();
  });
}

main() {
  check([], 0);
  check([1,2,3,null], 4);
  check(new Iterable.generate(0, (int index)=>index*2), 0);
  check(new Iterable.generate(10, (int index)=>index*2), 10);
}
