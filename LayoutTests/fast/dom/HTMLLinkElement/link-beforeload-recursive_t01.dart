/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that a beforeload event can mutate the firing link
 * element. This test passes if it does not crash and the link element only
 * loads its final (innermost) style sheet
 */
import "dart:html";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  document.head.append(new Element.html(
        '<div><link id="thelink" rel=stylesheet></div>',
        treeSanitizer: new NullTreeSanitizer()));

  var theLink = document.getElementById("thelink");

  var beforeloadRecurseCount = 5;

  linkBeforeLoadHandler(_) {
    if (--beforeloadRecurseCount > 1) {
      var newHrefAttr = theLink.getAttribute("href")
        + "#$beforeloadRecurseCount";
      theLink.setAttribute("href", newHrefAttr);
    } else if (beforeloadRecurseCount == 1) {
      theLink.setAttribute("href", "$root/resources/stylesheet-pre-pass.css");
      asyncEnd();
    }
    return true;
  }

  asyncStart();

  theLink.addEventListener("beforeload", linkBeforeLoadHandler);

  theLink.setAttribute("href", "$root/resources/stylesheet-pre-fail.css");

  theLink.remove();
  theLink = null;
}
