/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E singleWhere(bool test(E element))
 * Returns the single element that satisfies [test].
 * @description Checks that the single element satisfying [test]
 * is returned.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  var runes = new Runes('aaaacaaBa');

  var res = runes.singleWhere( (e) => e > 0x61 );
  Expect.equals(0x63, res);

  res = runes.singleWhere( (e) => e < 0x61 );
  Expect.equals(0x42, res);
}
