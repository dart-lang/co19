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
import "pwd.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var style = new Element.html('''
      <style>
      .test {
        font-family: 'myahem';
      }
      #a, #b, #container { position:absolute; }
      #b { top: 20px }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
  
  document.body.setInnerHtml('''
      <div id=container>
      <div id=a>Text</div>
      <div id=b class="test">Text</div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  setTimeout(
      () {
        var link = document.createElement("link");
        link.setAttribute("href", "$root/resources/ahem.css");
        link.setAttribute("rel", "stylesheet");
        link.setAttribute("type", "text/css");
        document.head.append(link);
        setTimeout(() {
          var a = document.getElementById('a');
          var b = document.getElementById('b');
          shouldBeFalse(getComputedStyle(a).width == getComputedStyle(b).width);
          asyncEnd();
        }, 1000);
      },
      1);
}
