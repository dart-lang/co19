/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws NullPointerException if one of arguments is null.
 * @description Checks that passing a null argument results in NullPointerException
 * @author msyabro
 * @reviewer rodionov
 * @needsreview undocumented
 */


main() {
  check(null, "");
  check(["1", "2"], null);
  //check([], null);         //TODO: add test for empty lists
  check(null, null);
}

void check(List<String> arr, String sep) {
  try {
    Strings.join(arr, sep);
    Expect.fail("NullPointerException is expected");
  } on NullPointerException catch(e) {}
}
