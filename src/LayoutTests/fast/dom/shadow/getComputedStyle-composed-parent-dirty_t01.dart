/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description getComputedStyle should update style if the parent node in the
 * composed tree needs a recalc.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="host">
        <div id="inside"></div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var root = document.getElementById("host").createShadowRoot();
  var wrapper = root.append(document.createElement("div"));
  wrapper.append(document.createElement("content"));
  wrapper.offsetTop;
  wrapper.style.color = 'red';
  var inside = document.getElementById("inside");
  shouldBeEqualToString(inside.getComputedStyle().color, "rgb(255, 0, 0)");
}
