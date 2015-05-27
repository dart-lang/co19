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
<div style="position:relative">
<div style="-webkit-writing-mode: vertical-rl; background-color: green; width: 100px; height: 100px;">
    <div style="width: 5px"></div>
    <div id=vertical style="background-color: yellow; width: 10px; position: relative; left: -20px;"></div>
</div>
</div>

<div style="position:relative">
<div style="-webkit-writing-mode: horizontal-bt; background-color: red; width: 100px; height: 100px;">
    <div style="height: 5px"></div>
    <div id=horizontal style="background-color: orange; height: 10px; position: relative; top: -20px;"></div>
</div>
</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.getElementById("vertical").offsetLeft, 65);
  shouldBe(document.getElementById("horizontal").offsetTop, 65);
}
