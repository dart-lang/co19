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
      <select id="target">
          <option>FAIL</option>
      </select>
      <p id="result">
          FAIL: Test did not run
      </p>
      ''', treeSanitizer: new NullTreeSanitizer());

  var target = document.getElementById("target");
  target.append(document.createElement("link"));
  target.offsetTop;

  target.innerHtml = "<option>PASS</option>";

  document.getElementById("result").innerHtml = target.value;
}
