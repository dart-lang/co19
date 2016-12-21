/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E singleWhere(bool test(E element))
 * If no or more than one element match then a [StateError] is thrown.
 * @description Checks that a [StateError] is thrown if more than one
 * element match [test].
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  var runes = new Runes('\x01\x02\x03\x04\x05');
  Expect.throws(() {runes.singleWhere( (e) => true);}, (e) => e is StateError);
  Expect.throws(() {runes.singleWhere( (e) => e != 0);}, (e) => e is StateError);
}
