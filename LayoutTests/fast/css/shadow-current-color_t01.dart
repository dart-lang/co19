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
  dynamic style = new Element.html('''
      <style>
          .circle {
              display: inline-block;
              width: 200px;
              height: 200px;
              border-radius: 100px;
              margin: 100px;
              box-shadow : 0 0 50px currentColor;
              background: currentColor;
              color: white;
          }
          .animation {
              transition: all 0.25s linear;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="circle1" class="circle" data-from="white" data-to="rgb(255, 0, 0)">
          &nbsp;
      </div>
      <div id="circle2" class="circle" data-from="white" data-to="rgb(0, 128, 0)">
          &nbsp;
      </div>
      <div id="circle3" class="circle" data-from="white" data-to="rgb(64, 64, 255)">
          &nbsp;
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var RGB_REGEXP = new RegExp(r'rgb\([0-9]+, [0-9]+, [0-9]+\)');
  var elementColors = {};
  var timer;

  testColor(id)
  {
    var expectedColor = document.getElementById(id).dataset['to'];
    var actualColor = elementColors[id];
    if (expectedColor == actualColor)
      testPassed(id + ' has ' + expectedColor + ' shadow as expected.');
    else
      testFailed(id + ' has ' + actualColor + ' shadow, expected ' + expectedColor + '.');
  }

  finish()
  {
    testColor('circle1');
    testColor('circle2');
    testColor('circle3');
    asyncEnd();
  }

  onTransitionend(e)
  {
    var style = getComputedStyle(e.target);
    elementColors[e.target.id] = RGB_REGEXP.firstMatch(style.boxShadow)[0];
    if (timer == null)
      timer = setTimeout(finish, 0);
  }

  asyncStart();

  // Force a layout so that changing the classname below causes an animation.
  document.body.offsetHeight;

  dynamic elements = document.getElementsByClassName('circle');
  for (var el in elements) {
    el.style.color = el.dataset['from'];
  }
  for (var el in elements) {
    el.classes.add('animation');
    el.addEventListener('transitionend', onTransitionend, false /* capture */ );
    el.style.color = el.dataset['to'];
  }
}
