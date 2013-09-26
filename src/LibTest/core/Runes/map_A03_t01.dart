/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable map(f(E element))
 * The transformed elements will not be cached. Iterating multiple times
 * over the the returned [Iterable] will invoke the supplied
 * function [f] multiple times on the same element.
 * @description Checks that [f] will be invoked every time
 * [Iterable] is iterated.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  var count = 0;
  f(e) {
    count++;
    return e;
  }

  var runes = new Runes('string');
  var res = runes.map(f);

  res.elementAt(0);
  Expect.equals(1, count);

  res.elementAt(0);
  Expect.equals(2, count);

  res.elementAt(3);
  Expect.equals(3, count);

  res.elementAt(3);
  Expect.equals(4, count);

  res.elementAt(1);
  Expect.equals(5, count);
}
