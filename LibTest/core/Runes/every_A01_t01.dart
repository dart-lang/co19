/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool test(E element))
 * Returns true if every elements of this collection satisfy
 * the predicate [test]. Returns false otherwise.
 * @descriptionCheck that true is returned only if every element
 * of the list satisfies the predicate [f].
 * @author msyabro
 */
import "../../../Utils/expect.dart";

bool pred(element) => element > 5;

main() {
  var runes;
  runes = new Runes('');
  Expect.isTrue(runes.every(pred));

  runes = new Runes('\x01');
  Expect.isFalse(runes.every(pred));

  runes = new Runes('\x01\x02\x03\x04\x05\x01\x02\x03\x04\x05');
  Expect.isFalse(runes.every(pred));

  runes = new Runes('\u0100');
  Expect.isTrue(runes.every(pred));

  runes = new Runes('\x06\x07\x08\x09\x0a');
  Expect.isTrue(runes.every(pred));

  runes = new Runes('\x06\x07\x08\x09\x01');
  Expect.isFalse(runes.every(pred));
}
