/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this string is empty.
 * @description Checks that this method works
 * @author msyabro
 * @needsreview First newline is removed in multiline string
 * if it is immediately following the first triple-quote,
 * should leading whitespaces in each line be removed or be kept?
 */


main() {
  Expect.isTrue("".isEmpty() == true);
  Expect.isTrue(" ".isEmpty() == false);
  $CHECK("""
  """.isEmpty() == false); //???? 
  Expect.isTrue("\u0000".isEmpty() == false);
}
