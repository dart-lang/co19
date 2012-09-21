/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [NullPointerException] if [from] is [:null:].
 * @description Checks that NPE is thrown as expected.
 * @author varlax
 * @reviewer iefremov
 */

check(list) {
  try {
    list.setRange(0, 1, null);
    Expect.fail("expected NPE");
  } on NullPointerException catch(ok) {}
}

main() {
  check(new List(10));

  var dst = new List();
  dst.length = 10;
  check(dst);
  check([1,2,3]);
  check(new List.from([1,2,3]));
}

