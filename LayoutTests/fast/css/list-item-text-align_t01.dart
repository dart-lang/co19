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
  document.body.setInnerHtml('''
      <h3>
      This test verifies that text-align:-webkit-match-parent is the default style for list elements.
      </h3>

      <div>
      The test passes if all the lines containing the text "Left Align" are aligned to the left and vice-versa for "Right Align".
      </div>

      <ul dir=ltr>
        <li dir=ltr class=l><span>Left aligned</span></li>
        <li dir=rtl class=l><span>Left aligned although this li has dir=rtl because li's text-align is match-parent by default.</span></li>
      </ul>

      <ul dir=ltr style="text-align:start">
        <li dir=ltr class=l>Left aligned</li>
        <li dir=rtl class=l>Left aligned</li>
      </ul>

      <ul dir=ltr style="text-align:end">
        <li dir=ltr class=r>Right aligned</li>
        <li dir=rtl class=r>Right aligned</li>
      </ul>

      <ul dir=rtl style="text-align:start">
        <li dir=ltr class=r>Right aligned</li>
        <li dir=rtl class=r>Right aligned</li>
      </ul>

      <ul dir=rtl style="text-align:end">
        <li dir=ltr class=l>Left aligned</li>
        <li dir=rtl class=l>Left aligned</li>
      </ul>

      <ul dir=rtl style="text-align:left">
        <li dir=ltr class=l>Left aligned</li>
        <li dir=rtl class=l>Left aligned</li>
      </ul>

      <ul dir=rtl style="text-align:right">
        <li dir=ltr class=r>Right aligned</li>
        <li dir=rtl class=r>Right aligned</li>
      </ul>
      ''', treeSanitizer: new NullTreeSanitizer());

  // Checks that the given element is left aligned if expectedAlignment is 'left', or right aligned if
  // expectedAlignment is 'right'.
  assertAlignment(enclosingListElement, i, expectedAlignment)
  {
    var computedStyle = getComputedStyle(enclosingListElement, null);
    var leftAlign = expectedAlignment == 'left';

    if (computedStyle.textAlign == 'start') {
      // For the case of -webkit-auto check the offset of the text on screen
      // rather than examining the computed style.
      var elementLeftEdge = enclosingListElement.children[0].offsetLeft;
      var isLeftAligned = elementLeftEdge < document.body.clientWidth/2;
      enclosingListElement.innerHtml = (leftAlign == isLeftAligned ? 'PASS' : 'FAIL');
      shouldBe(leftAlign, isLeftAligned);
      return;
    }

    if (leftAlign && computedStyle.textAlign == 'left')
      enclosingListElement.innerHtml = 'PASS';
    else if (!leftAlign && computedStyle.textAlign == 'right')
      enclosingListElement.innerHtml = 'PASS';
    else
      enclosingListElement.innerHtml = 'FAIL';

    shouldBeTrue(leftAlign && computedStyle.textAlign == 'left'
        || !leftAlign && computedStyle.textAlign == 'right');
  }

  // Actual test.
  var leftAlignedDivs = document.querySelectorAll(".l");
  for (var i = 0; i < leftAlignedDivs.length; i++)
    assertAlignment(leftAlignedDivs[i], i, 'left');

  var rightAlignedDivs = document.querySelectorAll(".r");
  for (var i = 0; i < rightAlignedDivs.length; i++)
    assertAlignment(rightAlignedDivs[i], i, 'right');
}
