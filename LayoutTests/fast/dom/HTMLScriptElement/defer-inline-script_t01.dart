/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that inline scripts are not deferred.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="console"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var script0 = new Element.html('''
    <script>
      function log(msg) {
        document.getElementById('console').innerText = msg;
      }
    </script>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.body.append(script0);

  var script1 = new Element.html('''
    <script src="data:text/javascript,log('PASS');" defer></script>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.body.append(script1);

  var script2 = new Element.html('''
  <script defer>
    log('FAIL');
  </script>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.body.append(script2);
}
