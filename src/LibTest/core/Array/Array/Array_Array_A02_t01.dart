/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws NullPointerException for null input.
 * @description Checks that exception is thrown.
 * @author iefremov
 * @reviewer msyabro
 * @needsreview
 */



main() {
  try {
    new Array(null);
    Expect.fail("expected NullPointerException");
  } catch(NullPointerException ok) {}
}
