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
    <p>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=37900">bug 37900</a>:
    clone() does not preserve z-index with more than six digit</p>

    <div style="position:absolute; top: 80px">
        <div id="layer" style="position:absolute; left:10px; top:10px; width:100px; height:100px; border:solid 1px red; background:#fff0f0; z-index:20002000">
        </div>
        <div style="position:absolute; left:25px; top:30px; width:100px; height:100px; border: solid 1px #006600; background:#f0fff0; z-index:1000">
        </div>
    </div>
    <div id="msgs">
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var oldEl = document.getElementById('layer');
  oldEl.style.left = '50px';

  var newEl = oldEl.clone(true);
  var container = oldEl.parentNode;
  oldEl.remove();
  container.append(newEl);

  var msgs = [];
  msgs.add(newEl.style.zIndex == "20002000" ? "PASS" : "FAIL");
  document.getElementById('msgs').innerHtml = msgs.join('<br/>');
}
