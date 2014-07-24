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
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <div id="a" style="background-color: green !important">The background of this element should be green. It is </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var a = document.getElementById("a");
  a.style.backgroundColor = "red";
  a.innerHtml += a.style.backgroundColor;

  shouldBe(a.style.backgroundColor, "green");
}
