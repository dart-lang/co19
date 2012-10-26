/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A for statement of the form for (varOrType? id in e) s
 *  is equivalent to the following code:
 *    var n0 = e.iterator();
 *    while (n0.hasNext) {
 *      varOrType? id = n0.next();
 *      s
 *    }
 *  where n0 is an identiﬁer that does not occur anywhere in the program.
 * @description Checks that all of the mentioned methods are executed in the specified order.
 * @author iefremov
 * @reviewer rodionov
 */

var log = "";
addLog(String s) {
  log = '$log$s';
}

class TestIterator implements Iterator {
  next() {
    addLog("next()");
  }

  bool get hasNext {
    if(i < 2) {
      addLog("hasNext");
      i++;
      return true;
    }
    addLog("hasNext-exited");
    return false;
  }
  static int i = 0;
}

class TestIterable implements Iterable {
  Iterator iterator() {
    addLog("iterator()");
    return new TestIterator();
  }
}

main() {
  for ( var id in new TestIterable() ) {
    addLog("addLog()");
  }
  Expect.equals("iterator()hasNextnext()addLog()hasNextnext()addLog()hasNext-exited",
    log, "Wrong 'for statement' execution!");
}
