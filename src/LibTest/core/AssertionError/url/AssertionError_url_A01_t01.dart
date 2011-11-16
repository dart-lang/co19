/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that the URL is recorded correctly.
 * @author rodionov
 * @reviewer msyabro
 * @needsreview Mark this test for checked mode only.
 */
 
main() {
  try {
    assert(false);
    Expect.fail("AssertionError expected");
  } catch (AssertionError e) {
    Expect.isTrue(e.url.endsWith("LibTest/core/AssertionError/url/AssertionError_url_A01_t01.dart"));
    print(e.url);
  }
}
