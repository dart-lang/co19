/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this string is empty.
 * @description Checks that this method works correctly
 * @author msyabro
 * @reviewer rodionov
 */


main() {
  Expect.isTrue("".isEmpty == true);
  Expect.isTrue(" ".isEmpty == false);
  Expect.isTrue("""
  """.isEmpty == false); 
  Expect.isTrue("\u0000".isEmpty == false);
  Expect.isTrue("u0000".isEmpty == false);
}
