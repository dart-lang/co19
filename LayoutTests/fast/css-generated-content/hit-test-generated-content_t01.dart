/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      #target {
        position: relative;
        width: 100px;
        height: 100px;
      }

      #target::before {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: gray;
        content: "";
      }

      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>Tests hit testing on generated content</p>
      <div id="target">&nbsp;</div>

      <div id="results">
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var hitElement = document.elementFromPoint(58, 58);
  shouldBeNonNull(hitElement);
  shouldBe(hitElement.id, 'target');
}
