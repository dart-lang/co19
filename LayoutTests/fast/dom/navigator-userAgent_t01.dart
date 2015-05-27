/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var userAgent = window.navigator.userAgent;
  shouldBeTrue(userAgent.contains("Mozilla"));
  shouldBeTrue(userAgent.contains("AppleWebKit"));
  shouldBeTrue(userAgent.contains("KHTML, like Gecko"));
}
