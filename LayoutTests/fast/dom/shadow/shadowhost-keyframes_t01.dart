/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test if @keyframes works for shadow host when using :host. 
 * i.e. crbug.com/332577
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html(''' 
    <style>
    @-webkit-keyframes anim {
        from {
            background-color: red;
        }
        to {
            background-color: green;
        }
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <div id="host"></div>
    <div id="result"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  getColor(element) {
    return element.getComputedStyle().color;
  }

  var host = document.getElementById('host');
  var sr = host.createShadowRoot();
  sr.setInnerHtml('<style>@-webkit-keyframes anim {'
    + 'from { color: red; } to { color: green; } }'
    + ':host { -webkit-animation: anim 0.5s both; color: red; }</style>'
    + 'I should become green', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  setTimeout(() {
    shouldBe(getColor(document.getElementById('host')), "rgb(0, 128, 0)");
    asyncEnd();
  }, 1000);
}
