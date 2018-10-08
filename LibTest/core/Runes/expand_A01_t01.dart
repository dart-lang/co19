/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable expand(Iterable f(E element))
 * Expand each element of this Iterable into zero or more elements.
 * The resulting Iterable will run through the elements returned
 * by f for each element of this, in order.
 * @description Checks that the returned [Iterable] contains correct elements
 * and has the correct length.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

check(string) {
  var runes = new Runes(string);

  var res = runes.expand( (element) => [element*2]);
  Expect.equals(runes.length, res.length);
  for(int i = 0; i < runes.length; ++i) {
    Expect.equals(runes.elementAt(i) * 2, res.elementAt(i));
  }

  res = runes.expand( (element) => [element, element + 1]);
  Expect.equals(runes.length * 2, res.length);
  for(int i = 0; i < runes.length; ++i) {
    Expect.equals(runes.elementAt(i), res.elementAt(2*i));
    Expect.equals(runes.elementAt(i) + 1, res.elementAt(2*i + 1));
  }

  res = runes.expand( (element) => [] );
  Expect.equals(0, res.length);
}

main() {
  check('');
  check('a');
  check('string string');
}
