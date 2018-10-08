/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description :checked pseudo selector not matching selected option
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p>This is a :checked pseudo selector test.</p>
      <div id="console"></div>

      <form action=''>
      <select id='sel' name='select' multiple>
          <option id="option1" selected>option1</option>
          <option id="option2">option2</option>
          <option id="option3" selected>option3</option>
          <option id="option4">option4</option>
      </select>
      <br>
      <input id="radio1" type="radio" name="radiotest" value="radio1" /> Radio1
      <br>
      <input id="radio2" type="radio" name="radiotest" value="radio2" checked/> Radio2
      <br>
      <input id="checkbox1" type="checkbox" name="checktest" value="checkbox1" checked/> Checkbox1
      <br>
      <input id="checkbox2" type="checkbox" name="checktest" value="checkbox2" checked/> Checkbox2
      </form>
      <br>
      ''', treeSanitizer: new NullTreeSanitizer());

  var totalChecked = 0;
  var expectedCount = 0;
  var idArray =
    ["option1","option2","option3","option4","radio1","radio2","checkbox1","checkbox2"];

  isCheckedOrSelected(id) {
    dynamic obj = document.getElementById(id);
    if (obj.checked || obj.selected)
      return true;
  }

  runTest() {
    for (var i = 0; i < idArray.length; i++) {
      if (isCheckedOrSelected(idArray[i]))
        expectedCount++;
    }
    totalChecked = document.querySelectorAll(':checked').length;
    shouldBe(totalChecked,expectedCount);
  }

  runTest();
}
