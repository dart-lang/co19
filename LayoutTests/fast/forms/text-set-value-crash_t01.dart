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

main() {
  document.body.setInnerHtml('''
      <p>
          Test for <i><a href="http://bugs.webkit.org/show_bug.cgi?id=11115">http://bugs.webkit.org/show_bug.cgi?id=11115</a>
          REGRESSION: Crash on Flickr after hitting cancel from adding a note</i>.
      </p>
      <p>
          No crash means test PASS.
      </p>
      <div id="q">
          <textarea id="t">Lorem ipsum</textarea>
      </div>
      <div id="r">
          <input id="u" value="Lorem ipsum">
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());
    
  var t = document.getElementById("t");
  var q = document.getElementById("q");
  t.focus();
  q.style.display = 'none';
  t.value = '';

  var u = document.getElementById("u");
  var r = document.getElementById("r");
  u.focus();
  r.style.display = 'none';
  u.value = '';
}
