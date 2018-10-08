/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after /LayoutTests/fast/xsl/xslt-bad-import-uri.html
 * @description This tests that a bad @import URI does not cause a crash. 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var type = 'load';
  var x = new IFrameElement();
  document.body.append(x);
  
  asyncStart();
  x.onLoad.listen((e) {
    Expect.equals(type, e.type);
    asyncEnd();
  });
  
  x.src ="$testSuiteRoot/fast/xsl/resources/xslt-bad-import-uri.xml";
}
