/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws Error if [other] is null
 * @description Checks that Error is thrown is the argument is null.
 * @author rodionov
 * @reviewer msyabro
 * @needsreview undocumented
 */
import "../../../Utils/expect.dart";


main() {
  try {
    new Set.from(null);
    Expect.fail("Error is expected");
  } on Error catch(e) {}
}
