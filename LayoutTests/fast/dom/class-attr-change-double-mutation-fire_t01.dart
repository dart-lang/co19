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
    <div id="result"></div>
    <style>
        #test {}
    </style>
    <script>
    ''', treeSanitizer: new NullTreeSanitizer());

  var count = 0;

  setResult()
  {
    var result = document.getElementById('result');
    if (count == 1)
      result.innerHtml = "PASS";
    else
      result.innerHtml = "FAIL";
  }

  var test = document.createElement('div');
  test.addEventListener('DOMSubtreeModified',
      (_) { count++; setResult(); }, false);
  test.setAttribute('class', 'test');
}
