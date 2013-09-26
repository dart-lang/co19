/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion RuneIterator.at(String string, int index)
 * It is an error if the [index] position is in the middle of a surrogate pair.
 * @description Checks that it is an error if the [index] position
 * is in the middle of a surrogate pair.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

main() {
  Expect.throws( () {
     new RuneIterator.at('\u{10000}', 1);
  });
  Expect.throws( () {
    new RuneIterator.at('\u{10000}\u{10001}', 3);
  });
}
