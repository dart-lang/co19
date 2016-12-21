/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic firstWhere(bool test(E element), {Object orElse()})
 * By default, when orElse is null, a [StateError] is thrown.
 * @description Checks that a [StateError] is thrown.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

check(string) {
  var runes = new Runes(string);
  try {
    runes.firstWhere((e) => false);
    Expect.fail("StateError is expected");
  } on StateError catch(ok) {}
}

main() {
  check('');
  check('a');
  check(r"1234567890 !@#$%^&*()");
}
