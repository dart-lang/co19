/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description
 * This tests for a regression against https://bugs.webkit.org/show_bug.cgi?id=6841 
 * REGRESSION: WebKit (Thursday, January 26, 2006) crash in HTMLImageElementImpl::width().
 * No crash = test PASS
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var img = new ImageElement(); 
  img.width;
}
