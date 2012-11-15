/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Gets the next element in the iteration.
 * @description Checks that next element in the iteration is taken.
 * @author msyabro
 * @reviewer varlax
 */

void checkNext(Queue list) {
  Iterator it = list.iterator();
  var i = 0;
  list.forEach((var element) {
    Expect.equals(element, it.next());
  });
}

main() {
  Queue list = new Queue.from([null,0,"1",false]);
  checkNext(list);

  list = new Queue();
  for (var i=0; i < 100; i++) {
    list.add( -i);
  }
  checkNext(list);

  list = new Queue();
  list.addAll(["0","1","2","3","4","5",6,7,8,9,null]);
  checkNext(list);
}
