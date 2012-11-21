/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future wait(List futures)
 * throws an Error if [futures] is null.
 * @description Checks that the correct exception is thrown.
 * @author msyabro
 * @reviewer iefremov
 * @needsreview undocumented
 */

main() {
  try {
    var f = Futures.wait(null);
    Expect.fail("Error is expected");
  } on Error catch(e) {}
}
