/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks that a local file can set cookies.  See:
 * rdar://problem/5379090 REGRESSION: Cannot set cookies for local files
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  shouldBe(document.cookie.indexOf('ppkcookie1=testcookie'), -1);
  document.cookie = 'ppkcookie1=testcookie';
  shouldBeTrue(document.cookie.indexOf('ppkcookie1=testcookie') >= 0);
}
