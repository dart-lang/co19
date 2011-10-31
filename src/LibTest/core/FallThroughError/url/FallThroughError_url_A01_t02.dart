/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that the URL is recorded correctly when FallThroughError
 * is raised using a throwNew static method.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview Mark this test for checked mode only.
 */

main() {
  try {
    FallThroughError.throwNew(1);
    Expect.fail("FallThroughError expected");
  } catch (FallThroughError e) {
    Expect.isTrue(e.url.endsWith("LibTest/core/FallThroughError/url/FallThroughError_url_A01_t02.dart"));
  }
}
