/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws Error if the list contains null elements
 * @description Checks that passing a list containing null elements results in Error
 * @author rodionov
 * @reviewer pagolubev
 * @needsreview undocumented
 */
import "../../../Utils/expect.dart";


main() {
  check(["1", null], "");
  check([null, "1"], "");
  check([null], "");
  check([null, null], "");
}

void check(List<String> arr, String sep) {
  try {
    Strings.join(arr, sep);
    Expect.fail("Error is expected");
  } on Error catch(e) {}
}
