/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for crbug.com/274059. Should be able to override ::content
 * styles in shadow root style sheet from the document.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html(''' 
    <style>
      .contentClass {
        color: blue;
      }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.className = "bodyClass";
  document.body.setInnerHtml('''
    <template id="tmpl">
      <style>
        ::content > * {
          color: red;
        }
      </style>
      <content></content>
    </template>

    <div id="host" class="hostClass">
      <div class="contentClass">
        content
      </div>
    </div>

    <pre id='console'></pre>
    ''', treeSanitizer: new NullTreeSanitizer());

  var host = document.querySelector('#host');
  var root = host.createShadowRoot();
  var template = document.querySelector('#tmpl');
  root.append(template.content);
  shouldBe(document.querySelector(".contentClass").getComputedStyle().color,
      "rgb(0, 0, 255)");
}
