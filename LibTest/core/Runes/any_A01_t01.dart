/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool any(bool f(E element))
 * Returns true if one element of this collection satisfies
 * the predicate [test]. Returns false otherwise.
 * @description Checks that true is returned if one or more
 * elements satisfies the predicate f, false otherwise.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

bool pred(element) => element > 5;

main() {
  var runes;
  runes = new Runes('');
  Expect.isFalse(runes.any(pred));

  runes = new Runes('\x01');
  Expect.isFalse(runes.any(pred));

  runes = new Runes('\x01\x02\x03\x04\x05\x01\x02\x03\x04\x05');
  Expect.isFalse(runes.any(pred));

  runes = new Runes('\u0100');
  Expect.isTrue(runes.any(pred));

  runes = new Runes('\x06\x07\x08\x09\x0a');
  Expect.isTrue(runes.any(pred));

  runes = new Runes('\x01\x02\x03\x06\x04\x05');
  Expect.isTrue(runes.any(pred));
}
