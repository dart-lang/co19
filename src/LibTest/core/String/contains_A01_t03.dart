/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this string contains [other] starting at
 *            [startIndex] (inclusive).
 * @description Checks that empty regexp matches everything.
 * @author iefremov
 * @needsreview Issue 1289
 */

main() {
  Expect.isTrue("s".contains(new RegExp("")));
  Expect.isTrue("".contains(new RegExp("")));
  Expect.isTrue("Abyrvalg".contains(new RegExp("")));
}

