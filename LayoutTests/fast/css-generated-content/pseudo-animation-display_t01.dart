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
          width: 100px;
          height: 100px;
          background-color: red;
      }
      #target:after {
          display: block;
          position: relative;
          content: "";
          width: 50px;
          height: 50px;
          background-color: blue;    
      }
      #target.animated:after {
          -webkit-animation: anim 1ms forwards;
          animation: anim 1ms forwards;
      }
      @-webkit-keyframes anim {
          from {
              left: 0px;
              display: block;
          }
          to {
              left: 100px;
              display: none;
          }
      }
      @keyframes anim {
          from {
              left: 0px;
              display: block;
          }
          to {
              left: 100px;
              display: none;
          }
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div>
        Tests that an attempt to animate the display property of a pseudo element is
        ignored, and that the animation proceeds as expected.
      </div>
      <div id="target"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  test(style, property, expected) {
    shouldBe(style.getPropertyValue(property), expected);
  }

  completeTest(_) {
    var style = getComputedStyle(document.getElementById('target'), ':after');
    test(style, 'left', '100px');
    test(style, 'display', 'block');
    asyncEnd();
  }

  go(_) {
    var target = document.getElementById('target');
    target.addEventListener('webkitAnimationEnd', completeTest);
    target.classes.add('animated');
  }

  asyncStart();
  window.onLoad.listen(go);
}
