/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A for statement of the form for (finalVarOrType id in e) s is equivalent to
 * the the following code:
 * var n0 = e.iterator(); while (n0.hasNext()) { finalVarOrType id = n0.next();
 * s } where n0 is an identifier that does not occur anywhere in the program.
 * @description Checks that all needed methods are executed in the correct order.
 * @author iefremov
 */

var log = "";
addLog(String s) {
  log += s;
}

class TestIterator implements Iterator {
  next() {
    addLog("next()");
  }

  hasNext() {
    if(i < 2) {
      addLog("hasNext()");
      i++;
      return true;
    }
    addLog("hasNext()-exited");
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
  Expect.equals("iterator()hasNext()next()addLog()hasNext()next()addLog()hasNext()-exited",
    log, "Wrong 'for statement' execution!");
}
