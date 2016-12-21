/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic firstWhere(bool test(E element), {Object orElse()})
 * If none matches, the result of invoking the orElse function is returned.
 * @description Checks that the [orElse] function is invoked and
 * its result is returned if no element matches [test].
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  var count = 0;
  f () {
    count++;
    return 1;
  }
  var runes = new Runes('\x01\x02\x03\x04\x05\x06\x09');
  var res = runes.firstWhere( (element) => false, orElse: f);
  Expect.equals(1, count);
  Expect.equals(1, res);

  res = runes.firstWhere( (element) => element > 100, orElse: f);
  Expect.equals(2, count);
  Expect.equals(1, res);

  runes = new Runes('');
  res = runes.firstWhere( (element) => true, orElse: f);
  Expect.equals(3, count);
  Expect.equals(1, res);
}
