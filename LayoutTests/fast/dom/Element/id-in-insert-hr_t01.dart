/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test using id in execCommand(InsertHorizontalRule)
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="test1" contenteditable="true">foobar</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var s = window.getSelection();
  var e = document.getElementById("test1");
  s.setPosition(e, 0);

  var id = "hr";
  document.execCommand("InsertHorizontalRule", false, id);
  var hr = document.getElementById(id);

  Expect.isNotNull(hr);
}
