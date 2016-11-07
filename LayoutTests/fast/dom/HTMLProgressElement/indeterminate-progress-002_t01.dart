/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.head.append(new Element.html('''
    <style type="text/css">
    div { color: red; }
    progress:indeterminate + #test { color: green; }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer()));

  document.body.setInnerHtml('''
    <p>The test passes if the Filler Text below is green.</p>
    <progress></progress>
    <div id="test">Filler Text</div>
    ''', treeSanitizer: new NullTreeSanitizer());

    ProgressElement testDiv = document.getElementById("test");
    shouldBe(testDiv.getComputedStyle().getPropertyValue("color"),
        "rgb(0, 128, 0)");
}
