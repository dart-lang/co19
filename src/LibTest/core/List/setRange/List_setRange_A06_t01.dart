/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [NullPointerException] if [from] is [:null:].
 * @description Checks that NPE is thrown as expected.
 * @author varlax
 */


main() {
  int dstSize = 10;
  List dst = new List(dstSize);
  try {
    dst.setRange(0, 1, null);
    Expect.fail("expected NPE");
  } catch(NullPointerException ok) {}

  dst = new List();
  dst.length = dstSize;
  try {
    dst.setRange(0, 1, null, 0);
    Expect.fail("expected NPE");
  } catch(NullPointerException ok) {}
}

