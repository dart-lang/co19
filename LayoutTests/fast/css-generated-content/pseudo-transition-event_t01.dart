/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Transitions on :before and :after pseudo elements should run
 * and fire DOM events
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      #before:before,
      #after:after {
          content: "";
          display: block;
          height: 50px;
          width: 50px;
          -webkit-transition: width 1ms;
          transition: width 1ms;
      }

      #before.transition:before,
      #after.transition:after {
          height: 10px;
          width: 10px;
      }

      #before,
      #after {
          display: inline-block;
          border: 1px solid black;
          background: red;
      }

      #after.transition,
      #before.transition {
          background: green;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="before"></div>
      <div id="after"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var expectedEvents = [ ["width", "before", "::before"] , ["width", "after", "::after"] ];
  var currentEvent = 0;

  testTransition(id)
  {
    var div = document.getElementById(id);
    div.className = 'transition';
  }

  recordTransitionEvent(event)
  {
    shouldBe(event.propertyName, expectedEvents[currentEvent][0]);
    shouldBe(event.target.id, expectedEvents[currentEvent][1]);
    shouldBe(event.pseudoElement, expectedEvents[currentEvent][2]);
    if (currentEvent == 1) {
      asyncEnd();
    } else {
      currentEvent++;
      testTransition('after');
    }
  }

  document.addEventListener( 'transitionend', recordTransitionEvent);
  asyncStart();
  testTransition('before');
}
