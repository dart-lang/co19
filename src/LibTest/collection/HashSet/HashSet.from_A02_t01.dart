/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws Error if [other] is null
 * @description Checks that Error is thrown if the argument is null.
 * @author rodionov
 * @reviewer msyabro
 * @needsreview undocumented
 */
import "dart:collection";

main() {
  try {
    new HashSet.from(null);
    Expect.fail("Error is expected");
  } on Error catch(e) {}
}
