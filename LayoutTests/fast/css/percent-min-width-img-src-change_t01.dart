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
      <img id="percentMinWidthInTable" style="min-width:100%;" src="$root/resources/greenbox-100px.png">
      </td>
      </tr>
      </tbody>
      </table>
      <div style="position:absolute;top:200px;left:11px">
      <img id="percentMinWidthInAbsolute" style="min-width:100%;" src="$root/resources/greenbox-100px.png">
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

  imageCheckForMin(event) {
    var image = event.target;
    if (image.src.contains("greenbox-100px.png")) {
      image.src = "$root/resources/greenbox.png";
    }
    else {
      ++completed;
      if (image.width != 25) {
        ++failures; 
        failuresDetail += "${image.id}: ${image.width} (expected: 25)\n";
      }
      if (completed == 2)
        printResult();
    }
  }

  document.getElementById('percentMinWidthInTable').onLoad.listen(imageCheckForMin);
  document.getElementById('percentMinWidthInAbsolute').onLoad.listen(imageCheckForMin);

  asyncStart();
}
