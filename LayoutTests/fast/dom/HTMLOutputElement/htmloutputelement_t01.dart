/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for content attributes of the output element.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <span id="for-target1"></span>
    <span id="for-target2"></span>
    <output id="output1" name="output1">A value</output>
    <output id="output2" for="for-target1"></output>
    <output id="output3" for=" for-target1 for-target2 "></output>
    ''', treeSanitizer: new NullTreeSanitizer());

  var output1 = document.getElementById('output1');
  var output2 = document.getElementById('output2');
  var output3 = document.getElementById('output3');

  shouldBeEqualToString(output1.type, 'output');
  shouldBeEqualToString(output1.name, 'output1');
  shouldBeEqualToString(output1.value, 'A value');

  shouldEvaluateTo(output2.htmlFor.length, 1);
  shouldBeEqualToString(output2.htmlFor.item(0), 'for-target1');
  shouldBeEqualToString(output2.htmlFor.value, 'for-target1');

  shouldEvaluateTo(output3.htmlFor.length, 2);
  shouldBeEqualToString(output3.htmlFor.item(0), 'for-target1');
  shouldBeEqualToString(output3.htmlFor.item(1), 'for-target2');
  shouldBeEqualToString(output3.htmlFor.value, ' for-target1 for-target2 ');
}
