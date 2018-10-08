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
      <p>
          Test for <i><a href="http://bugs.webkit.org/show_bug.cgi?id=11444">http://bugs.webkit.org/show_bug.cgi?id=11444</a>
          REGRESSION (r17378): Exception (-[NSCFDictionary setObject:forKey:]: attempt to insert nil value) when submitting a form with an empty uninitialized field</i>.
      </p>
      <p id="result">FAIL</p>
      <hr>
      <form id="t"><input></form>
      ''', treeSanitizer: new NullTreeSanitizer());

  var url = window.location.href;

  var firstRun = url.indexOf('?') == -1 ||
    url.substring(url.indexOf('?')+1, url.length) != "";

  if (firstRun) {
    FormElement f = document.getElementById("t");
    f.submit();
  } else {
    document.getElementById("result").text = "PASS";
  }
}
