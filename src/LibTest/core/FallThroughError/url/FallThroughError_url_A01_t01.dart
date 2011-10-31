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
    switch(false) {
      case true:
        print("great!");
        break;
      case false:
        print("not so great!");
      default: // this is line 24
        print("just awesome!");
        break;
    }
    Expect.fail("FallThroughError expected");
  } catch (FallThroughError e) {
    Expect.isTrue(e.url.endsWith("LibTest/core/FallThroughError/url/FallThroughError_url_A01_t01.dart"));
  }
}
