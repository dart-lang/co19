/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool test(E element))
 * As long as the returned [Iterable] is not iterated over,
 * the supplied function [test] will not be invoked.
 * @description Checks that as long as the returned [Iterable] is not iterated
 * over, the supplied function [test] will not be invoked.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  var count = 0;
  test(e) {
    ++count;
    return true;
  }

  var runes = new Runes('abc');
  var res = runes.where(test);

  Expect.equals(0,count);
  res.elementAt(0);
  Expect.equals(1,count);
}
