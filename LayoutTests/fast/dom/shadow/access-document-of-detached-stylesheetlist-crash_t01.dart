/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for crbug.com/337059: accessing StyleSheetList::document()
 * from GC causes crash.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id='host'></div>
    <pre id='console'></pre>
    ''', treeSanitizer: new NullTreeSanitizer());

  var host = document.getElementById('host');
  var sr = host.createShadowRoot();
  sr.innerHtml = '<style>background-color: red;</style><div>Shadow</div>';

  // Need to use ShadowRoot.styleSheets API to create a styleSheetList.
  sr.styleSheets.length;
  host.remove();

  setTimeout(() {
    gc();
  }, 0);
}
