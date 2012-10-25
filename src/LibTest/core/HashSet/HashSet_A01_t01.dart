/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interface HashSet<E>
 * HashSet()
 * Creates an empty hash set.
 * @description Checks that an empty hash set is created.
 * @author rodionov
 * @reviewer msyabro
 * @needsreview undocumented
 */


main() {
  HashSet s = new HashSet();
  Expect.isTrue(s is HashSet);
  Expect.isTrue(s.isEmpty);
}
