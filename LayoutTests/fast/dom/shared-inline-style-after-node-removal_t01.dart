/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks that an element that shared its inline style
 * with one or more other elements still retain that style after one of the
 * sharing elements was destroyed.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="test" style="color: red">
          <p style="color: green"></p>
          <p style="color: green"></p>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var testDiv = document.getElementById('test');
  //var pees = testDiv.getElementsByTagName('p');
  var pees = testDiv.querySelectorAll('p');

  pees[1].remove();

  callMeMaybe()
  {
    var testDiv = document.getElementById('test');
    //var pees = testDiv.getElementsByTagName('p');
    var pees = testDiv.querySelectorAll('p');

    // Trigger a style recalc on pees[0].
    pees[0].style.background = 'white';

    var computedStyle = pees[0].getComputedStyle();
    shouldBe(computedStyle.color, 'rgb(0, 128, 0)');
    asyncEnd();
  }

  asyncStart();
  setTimeout(callMeMaybe, 10);
  gc();
}

