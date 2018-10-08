/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a [Stopwatch] in stopped state with a zero elapsed count.
 * @description Checks that this constructor executes without error and the
 *              elapsed count is indeed 0 and doesn't change.
 * @author rodionov
 */
import "../../../Utils/expect.dart";
 
main() {
  Stopwatch sw = new Stopwatch();
  Expect.equals(0, sw.elapsedTicks);
  for(int i = 0; i < 100; i++) {
    Expect.equals(0, sw.elapsedTicks);
  }
}
