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
      div:before {
        width: 100px;
        content: "";
        display: block;
        -webkit-transition: width 1ms;
      }

      div {
          padding: 10px;
          -webkit-transition: padding 20ms;
      }

      .transition {
          padding: 0px;
      }

      .transition:before {
          width: 10px;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>Pseudo elements should not dispatch events.</p>

      <div></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var div = document.body.querySelector('div');
  div.addEventListener('webkitTransitionEnd', (event) {
    shouldBeEqualToString((event.target as Element).tagName, 'DIV');
    if (event.target == div) {
      asyncEnd();
    }
  });
  asyncStart();
  div.className = 'transition';
}
