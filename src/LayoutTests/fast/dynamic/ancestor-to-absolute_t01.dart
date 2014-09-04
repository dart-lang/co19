/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description The test passed if it did not crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      Test that dynamically making element absolute positioned does not corrupt it's childrens layout dirty state. This passes if it does not crash.
      <div id=outer style="float:left" >
        <div>
          <div id=inner style="position:absolute; left:0px; top:0px; width:15px; height:15px;"></div>
        </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  // force layout
  document.getElementById("outer").offsetHeight;
  // this would corrupt layout dirty bits
  document.getElementById("outer").style.position = "absolute";
  // this would turn corruption into crash
  document.getElementById("inner").innerHtml =  "<table><tr><td></td></tr></table>";
}

