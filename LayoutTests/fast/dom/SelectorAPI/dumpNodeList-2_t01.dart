/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="test">
        <div></div>
        <div>
          <div class="target"></div>
        </div>
        <div>
          <div class="target"></div>
          <div></div>
        </div>
        <div id="test2" class="target">line 4</div>
        <div id="test3"></div>
        <p>line 5</p>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());


  testQuerySelectorAll(node, selectorString) =>
    node.querySelectorAll(selectorString).map((x) => x.runtimeType).toList();

  Expect.listEquals([DivElement, DivElement],
      testQuerySelectorAll(document, ".target + div"));
  
  Expect.listEquals([DivElement, DivElement],
      testQuerySelectorAll(document.getElementById("test"), ".target + div"));

  Expect.listEquals([],
      testQuerySelectorAll(document.getElementById("test2"), ".target + div"));

  Expect.listEquals([],
      testQuerySelectorAll(document.getElementById("test3"), ".target + div"));
}
