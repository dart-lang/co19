/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A for statement of the form for (finalConstVarOrType? id in e) s
 * is equivalent to the following code:
 *   var n0 = e.iterator;
 *   while (n0.moveNext()) {
 *     finalConstVarOrType? id = n0.current;
 *     s
 *   }
 * where n0 is an identifier that does not occur anywhere in the program, except
 * that for purposes of static typechecking, it is checked under the assumption
 * that n0 is declared to be of type T, where T is the static type of e.iterator.
 * @description Checks that all of the mentioned methods are executed in the
 * specified order.
 * @author iefremov
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

var log = "";
addLog(String s) {
  log = '$log$s';
}

class TestIterator implements Iterator {
  get current {
    addLog("current");
  }

  bool moveNext() {
    if (i < 2) {
      addLog("moveNext()");
      i++;
      return true;
    }
    addLog("moveNext()-exited");
    return false;
  }
  static int i = 0;
}

class TestIterable extends Iterable {
  Iterator get iterator {
    addLog("iterator");
    return new TestIterator();
  }
}

main() {
  for ( var id in new TestIterable() ) {
    addLog("addLog()");
  }
  Expect.equals("iteratormoveNext()currentaddLog()moveNext()currentaddLog()moveNext()-exited",
    log, "Wrong 'for statement' execution!");
}
