/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Check that we don't do unnecessary style recalcs for sibling
 * trees.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
          body { color: black; }
          .match+div div+div { color: green; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div>
          <div id="top"></div>
          <div>
              <div></div>
              <div id="green"></div>
          </div>
          <div>
              <div></div>
              <div></div>
              <div></div>
              <div></div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById("top").className = "match";

  shouldBe(getComputedStyle(document.getElementById('green'), null).color, 'rgb(0, 128, 0)');
}
