/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for crbug.com/274063, cannot style ::content with a rule
 * that includes :host.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.className = "bodyClass";
  document.body.setInnerHtml('''
    <template id="tmpl">
      <style>
        :host > .blue {
          color: blue;
        }
        :host > ::content > * {
          color: red;
        }
      </style>
      <div class="blue">I am blue!</div>
      <content></content>
    </template>

    <div id="host" class="hostClass">
      <div class="content">
        content
      </div>
    </div>

    <pre id="console"></pre>
    ''', treeSanitizer: new NullTreeSanitizer());

  var host = document.querySelector('#host');
  var root = host.createShadowRoot();
  var template = document.querySelector('#tmpl');
  root.append(template.content);

  shouldBe(document.querySelector("#host > .content").getComputedStyle().color,
      "rgb(255, 0, 0)");
}
