/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [NullPointerException] if any of arguments is [:null:].
 * @description Checks that NPE is thrown as expected.
 * @author varlax
 * @reviewer msyabro
 */

main() {
  try {
    new List.fromList(null, 0, 0);
    Expect.fail("NPE expected");
  } catch (NullPointerException ok) {}

  try {
    List a = ["0","1","2","3"];
    new List.fromList(a, null, 3);
    Expect.fail("NPE expected");
  } catch (NullPointerException ok) {}

  try {
    List a = ["0","1","2","3"];
    new List.fromList(a, 0, null);
    Expect.fail("NPE expected");
  } catch (NullPointerException ok) {}
}
