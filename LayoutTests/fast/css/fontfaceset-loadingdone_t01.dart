/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that onloadingdone is fired after style recalculation.
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var style = new Element.html('''
      <style>
      body {
        font-family: serif;
      }
      @font-face {
        font-family: 'ahem';
        src: url($root/../../resources/Ahem.ttf);
      }
      #test {
        position: absolute
      }
      #test span {
        font-family: ahem;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id=test>
        <a href="#">
          <span>aaa</span>
        </a>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var testDiv;

  runTests() {
    document.fonts.addEventListener('loadingdone', (_) {
      debug('loadingdone');
      testDiv = document.getElementById('test');
      shouldBeApprox(
          getNumValue(getComputedStyle(testDiv, '0').width, strip: "px"),
          48, 1);
    });

    setTimeout(() {
      shouldBeApprox(
          getNumValue(getComputedStyle(testDiv, '0').width, strip: "px"),
          48, 1);
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
