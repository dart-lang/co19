/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test setting of the title of stylesheets for both <link> and
 * <style> elements. See bug #11824.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var index = document.getElementsByTagName("style").length; // skip test framework's ones

  var f = new DocumentFragment.html('''
      <link media="all" href="IntentionallyMissingFile.css" rel="stylesheet" title="basic">
      <style type="text/css" id="q" title="basic">
      #foo {
          background-color: #66CCFF;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  runTest(_) {
    shouldBe(document.styleSheets[index].title, "basic");
    shouldBe(document.styleSheets[index+1].title, "basic");
    document.getElementById("q").title = "advanced";
    shouldBe(document.styleSheets[index+1].title, "advanced");
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(runTest);
}
