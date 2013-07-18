/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future<T> single
 * Returns the single element.
 * If this is empty or has more than one element throws a StateError.
 * @description Checks that a StateError if this is empty or has more than one element.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(Iterable<int> data) {
  MessageBox mbox=new MessageBox();
  for (var element in data) {
    mbox.sink.add(element);
  }
  mbox.sink.close();
  
  asyncStart();
  mbox.stream.single.then(
    (value){
      Expect.fail("nonexpected: $value");
    },
    onError:(error){
      Expect.isTrue(error is StateError);
      asyncEnd();
    }
  );
}

main() {
  check([]);
  check([1,2]);
  check(new Iterable.generate(0, (int index)=>null));
  check(new Iterable.generate(2, (int index)=>null));
}
