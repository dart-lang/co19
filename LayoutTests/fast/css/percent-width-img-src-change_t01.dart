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
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <div id="result"></div>
      <table>
      <tbody>
      <tr>
      <td>
      <img id="percentWidthInTable" style="width:100%;" src="$root/resources/greenbox.png">
      </td>
      </tr>
      </tbody>
      </table>
      <table>
      <tbody>
      <tr>
      <td>
      <img id="percentMaxWidthInTable" style="max-width:100%;" src="$root/resources/greenbox.png">
      </td>
      </tr>
      </tbody>
      </table>
      <div style="position:absolute;top:110px;left:110px">
      <img id="percentWidthInAbsolute" style="width:100%;" src="$root/resources/greenbox.png">
      </div>
      <div style="position:absolute;top:220px;left:110px">
      <img id="percentMaxWidthInAbsolute" style="max-width:100%;" src="$root/resources/greenbox.png">
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var completed = 0, failures = 0, failuresDetail = ""; 

  printResult() {
    var msg = "FAIL: $failures cases failed: " + failuresDetail;
    document.getElementById("result").text = failures > 0 ? msg : "PASS";
    if (failures > 0)
      testFailed(msg);
    asyncEnd();
  }

  imageCheckForMax(event) {
    var image = event.target;
    if (image.src.contains("greenbox.png"))
      image.src = "$root/resources/greenbox-100px.png";
    else {
      ++completed;
      if (image.width != 100) {
        ++failures; 
        failuresDetail += "${image.id}: ${image.width} (expected: 100)\n";
      }
      if (completed == 4)
        printResult();
    }
  }

  document.getElementById('percentWidthInTable').onLoad.listen(imageCheckForMax);
  document.getElementById('percentMaxWidthInTable').onLoad.listen(imageCheckForMax);
  document.getElementById('percentWidthInAbsolute').onLoad.listen(imageCheckForMax);
  document.getElementById('percentMaxWidthInAbsolute').onLoad.listen(imageCheckForMax);

  asyncStart();
}
