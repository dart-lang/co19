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
 */

#import("../../../../Utils/dynamic_check.dart");

main() {
  if(isCheckedMode()) {
    try {
      int x = true;
      Expect.fail("TypeError expected");
    } catch (TypeError e) {
      Expect.isTrue(e.url.endsWith("LibTest/core/TypeError/url/TypeError_url_A01_t01.dart"));
    }
  }
}
