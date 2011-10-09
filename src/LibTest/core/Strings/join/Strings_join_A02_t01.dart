/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws NullPointerException if one of arguments is null.
 * @description Check that NullPointerException is thrown
 * @author msyabro
 * @needsreview undocumented
 * When array is empty exeption is not thrown
 */


main() {
  try {
    String str = Strings.join(null, "");
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
  
  try {
    String str = Strings.join(["1", "2"], null);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
  
  try {
    String str = Strings.join([], null);//Exception is not thrown
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
  
  try {
    String str = Strings.join(null, null);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
}
