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
      <table><tr><td id="selectMe">This test passes if it does not crash.</td></tr><form style="display:inline" id="form"></form></table>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();

  window.onLoad.listen((_) {
    var selection = window.getSelection();
    var range =  document.createRange();
    range.selectNode(document.getElementById("selectMe"));
    selection.addRange(range);

    var table = document.createElement("table");
    document.getElementById('form').append(table);

    asyncEnd();
  });
}
