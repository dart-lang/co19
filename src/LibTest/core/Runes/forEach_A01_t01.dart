/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void action(E element))
 * Applies the function [f] to each element of this collection.
 * @description Checks that the function [f] is called for each element of the list.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

main() {
  var runes = new Runes('');
  var res = 0;
  runes.forEach( (e) {
    res += e;
  });
  Expect.equals(0, res);

  runes = new Runes('\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a');
  runes.forEach( (e) {
    res += e;
  });
  Expect.equals(55, res);
}
