/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that inline scripts are not async.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="console"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var script1 = new Element.html('''
    <script async>
      foo=1
      document.getElementById('console').innerText = 'FAIL';
    </script>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.body.append(script1);

  var script2 = new Element.html('''
    <script>
      foo;
      document.getElementById('console').innerText = 'PASS';
    </script>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.body.append(script2);
}
