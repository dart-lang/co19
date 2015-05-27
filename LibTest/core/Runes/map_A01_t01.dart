/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable map(f(E element))
 * Returns a lazy [Iterable] where each element e of this is
 * replaced by the result of f(e).
 * @description Checks that the correct [Iterable] is returned.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  var m = new Map<int,int>();
  m[1] = 2;
  m[2] = 5;
  m[6] = 9;
  m[10] = 120;
  m[3] = 76;
  m[0] = 0;
  m[8] = 7;
  var runes = new Runes('\x01\x02\x06\x0a\x03\x00\x08');
  var res = runes.map( (e) => m[e]);

  for(int i = 0; i < runes.length; ++i) {
    Expect.equals(m[runes.elementAt(i)], res.elementAt(i));
  }

  runes = new Runes('');
  res = runes.map( (e) => 0);
  Expect.isTrue(res.isEmpty);

  runes = new Runes('string');
  res = runes.map( (e) => 1 );
  for(int i = 0; i < runes.length; ++i) {
    Expect.equals(1, res.elementAt(i));
  }

}
