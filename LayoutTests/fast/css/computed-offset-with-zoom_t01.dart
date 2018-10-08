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

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var style = new Element.html('''
      <style>
          #container {
              width: 500px;
              height: 500px;
              position: relative;
          }
          #container > div {
              position: relative;
              border: 1px solid red;
              font-size: 20px;
              width: 100px;
              height: 100px;
          }
          #test-fixed  {
              left: 100px;
              right: 100px;
              top: 100px;
              bottom: 100px;
          }
          #test-percentage {
              left: 20%;
              right: 20%;
              top: 10%;
              bottom: 10%;
          }
          #test-viewport {
              left: 10vw;
              right: 10vw;
              top: 10vh;
              bottom: 10vh;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
        <p>
            Reported computed offset should not change with zoom level.
        </p>
        <div id="container">
            <div id="test-fixed"></div>
            <div id="test-percentage"></div>
            <div id="test-viewport"></div>
        </div>
     ''', treeSanitizer: new NullTreeSanitizer());

  var fixedElement = document.getElementById('test-fixed');
  var percentageElement = document.getElementById('test-percentage');
  var viewportElement = document.getElementById('test-viewport');

  test(zoomLevel) {
    document.body.style.zoom = zoomLevel.toString();
    var windowWidth = "${window.innerWidth ~/ 10}px";
    var windowHeight = "${window.innerHeight ~/ 10}px";

    shouldBe(getComputedStyle(fixedElement).top, '100px');
    shouldBe(getComputedStyle(fixedElement).right, '100px');
    shouldBe(getComputedStyle(fixedElement).bottom, '100px');
    shouldBe(getComputedStyle(fixedElement).left, '100px');

    shouldBe(getComputedStyle(percentageElement).top, '50px');
    shouldBe(getComputedStyle(percentageElement).right, '100px');
    shouldBe(getComputedStyle(percentageElement).bottom, '50px');
    shouldBe(getComputedStyle(percentageElement).left, '100px');

    shouldBe(getComputedStyle(viewportElement).top, windowHeight);
    shouldBe(getComputedStyle(viewportElement).right, windowWidth);
    shouldBe(getComputedStyle(viewportElement).bottom, windowHeight);
    shouldBe(getComputedStyle(viewportElement).left, windowWidth);
  }

  test(0.5);
  test(1.25);
  test(1.0);
}
