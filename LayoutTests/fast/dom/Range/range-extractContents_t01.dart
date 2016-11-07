/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p id="cont">
        <span>This <span id="start">tests</span></span>
        <span>that we don't crash when mutating the dom during</span>
        <span>an <code id="end">extractContents</code> call.</span>
    </p>
    ''', treeSanitizer: new NullTreeSanitizer());

  log(msg)
  {
    document.body.append(new Text(msg + '\n'));
  }

  document.addEventListener("DOMSubtreeModified", (_) {
    document.getElementById('cont').innerHtml = '';
  }, false);

  var r = document.createRange();
  try {
    r.setStartBefore(document.getElementById('start'));
    r.setEndAfter(document.getElementById('end'));
    var fragment = r.extractContents();
  } catch(e) {
  }
  log('PASS: No crash.');
}

