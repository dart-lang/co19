/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test verifies that a mutation event that removes inserted
 * nodes from the document doesn't crash upon the insertion of a new node into
 * the document.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div>PASS</div>
      <script id="dummy"></script>
      ''', treeSanitizer: new NullTreeSanitizer());

  mutationListener(event)
  {
    var element = event.target;
    element.remove();
  }

  document.body.addEventListener("DOMNodeInserted", mutationListener, false);

  /* append */
  document.body.append(document.createElement("script"));

  /* insertBefore */
  document.body.insertBefore(document.createElement("script"),
      document.getElementById("dummy"));

  /* replaceChild */
  document.getElementById("dummy").replaceWith(document.createElement("script"));

  /* Parser-inserted nodes don't fire mutation events. */
}
