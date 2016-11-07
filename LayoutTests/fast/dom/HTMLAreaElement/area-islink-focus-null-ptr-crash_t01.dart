/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description
 * http://code.google.com/p/chromium/issues/detail?id=73650
 * https://bugs.webkit.org/show_bug.cgi?id=54877
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="log">FAIL</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  AreaElement oArea = document.createElement('area');
  oArea.href = '0';
  oArea.focus();

  document.getElementById('log').innerHtml = "PASS";
}
