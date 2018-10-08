/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
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
    <div id="d1"></div>
    <div id="d2"></div>
    <div id="result"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  getBackgroundColor(element) {
    return element.getComputedStyle().backgroundColor;
  }

  var shadowRootWithKeyframe = document.getElementById("d1").createShadowRoot();
  shadowRootWithKeyframe.innerHtml = '<style>@-webkit-keyframes "anim" {' +
    'from { background-color:red; } to { background-color: blue; } }' +
    '#box { height: 100px; width: 100px; background: red; ' +
      '-webkit-animation: "anim" 0.5s both; }</style>' +
      '<div id="box"></div>';

  var shadowRootWithoutKeyframe = document.getElementById("d2").createShadowRoot();
  shadowRootWithoutKeyframe.innerHtml = '<style>' +
    '#box { height: 100px; width: 100px; background: red; ' +
      '-webkit-animation: "anim" 0.5s both; }</style>' +
      '<div id="box"></div>';

  asyncStart();
  setTimeout(() {
    shouldBe(getBackgroundColor(shadowRootWithKeyframe.getElementById('box')), "rgb(0, 0, 255)");
    shouldBe(getBackgroundColor(shadowRootWithoutKeyframe.getElementById('box')), "rgb(255, 0, 0)");
    asyncEnd();
  }, 1000);
}
