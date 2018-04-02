/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests createContextualFragment does not mark scripts elements 
 * it parsed as already started.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="test"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var range = document.createRange();
  var node = document.getElementById("test");
  range.selectNodeContents(node);

  node.append(range.createContextualFragment("""
    <script>
      document.body.appendChild(document.createElement('p'));
    </script>"""));

  shouldBe(document.body.querySelectorAll('p').length, 1);
}
