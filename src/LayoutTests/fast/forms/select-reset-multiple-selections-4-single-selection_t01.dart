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
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <p>This test checks to see what happens if we mark 2 items as selected in a single selection select element.</p>
      <p>If The test succeeds one should see 3 lines below the ruller below each containing the word SUCCEEDED in it.</p>
      <form id="form1" method="post" action="form_resp.asp">
        <select name="Select" size="2" id="select1">
          <option selected="selected">1</option>
          <option>2</option>
          <option selected="selected">3</option>

          <option>4</option>
        </select>
      <input type="reset" name="reset" value="Reset 1" id="reset1"/><br/>
      <hr>
      <p><ol id=console></ol></p>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  var selectElement = document.getElementById("select1");
  shouldBe(selectElement.value, "3");
  selectElement.queryAll("option")[1].selected=true;
  shouldBe(selectElement.value, "2");
  document.getElementById("reset1").click();
  shouldBe(selectElement.value, "3");
}
