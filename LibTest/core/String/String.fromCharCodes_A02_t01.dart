/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion null list elements result in an ArgumentError
 * @description Tries to pass a list with null values
 * @author msyabro
 */
import "../../../Utils/expect.dart";

void check(List<int> list) {
  Expect.throws(() {
    new String.fromCharCodes(list);
  }, (e) => e is ArgumentError);
}

main() {
  check([null]);
  check([0, 1, 2, 3, null]);
  check([null, null]);
}
