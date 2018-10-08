/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that the event handlers of FontFaceSet are called in the
 * correct order.
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      @font-face {
        font-family: 'ahem';
        src: url($root/../../resources/Ahem.ttf);
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div style="font-family: ahem">Hello, world!</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var event;
  var numberOfEvents = 0;

  handleEvent(e) {
    event = e;
    shouldBeEqualToString(event.type, ['loading', 'loadingdone'][numberOfEvents]);
    numberOfEvents++;
  }

  runTests() {
    document.fonts.addEventListener('loading', handleEvent);
    document.fonts.addEventListener('loadingdone', handleEvent);
    document.fonts.addEventListener('loadingerror', handleEvent);

    /*document.fonts.ready().then(() {
      shouldBe('numberOfEvents', '2');
      asyncEnd();
    });*/

    setTimeout(() {
      shouldBe(numberOfEvents, 2);
      asyncEnd();
    }, 500);
  }

  asyncStart();

  if (document.fonts != null)
    runTests();
  else {
    testFailed('document.fonts does not exist');
    asyncEnd();
  }
}
