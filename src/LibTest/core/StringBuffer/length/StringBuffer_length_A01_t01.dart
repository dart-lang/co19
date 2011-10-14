/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the length of the buffer.
 * @description Checks that a correct value is returned
 * @author msyabro
 * @reviewer rodionov
 */


main() {
  Expect.equals(0, new StringBuffer().length);
  Expect.equals(0, new StringBuffer("").length);
  Expect.equals(1, new StringBuffer("\u0000").length);
  Expect.equals(1, new StringBuffer(" ").length);
  Expect.equals(6, new StringBuffer("string").length);
}
