/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description If this test passes, all borders have the same color: #d0d0d0.
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      .ui-btn-up-c
      {
          border: 1px solid #d0d0d0;
          background: #ffffff;
          color: #444444;
      }

      .ui-link-inherit 
      {
          text-decoration: none;
          white-space: nowrap;
      }

      .ui-btn-up-c:visited, .ui-btn-up-c a.ui-link-inherit
      {
          color: #444444;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <ul>
      <iframe src="$root/resources/dummy.html" style="display:none"></iframe>
      <li class="ui-btn-up-c">
        <span class="ui-btn-up-c">This span should have borders with #d0d0d0 color.</span>
      </li>
      <li class="ui-btn-up-c">
        <a href="$root/resources/dummy.html" class="ui-link-inherit">
          <span class="ui-btn-up-c">This span should also have borders with #d0d0d0 color.</span>
        </a>
      </li>
      </ul>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var spans = document.querySelectorAll('span');
  shouldBe(spans[0].getComputedStyle().borderColor, "rgb(208, 208, 208)");
  shouldBe(spans[1].getComputedStyle().borderColor, "rgb(208, 208, 208)");
}
