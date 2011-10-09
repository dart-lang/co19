/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new string where the first occurrence of [from] in this string
 * is replaced with [to].
 * @description Try to pass null as [from] or [to]
 * @author msyabro
 * @needsreview undocumented
 */


main() {
  try {
    "aaa".replace("a", null);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
  
  try {
    "aaa".replace(null, "");
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
  
  try {
    "aaa".replace(null, null);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
}
