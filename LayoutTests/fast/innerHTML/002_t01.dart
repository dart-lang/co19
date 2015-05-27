/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;
  var html = '<b>this text should be bold both times</b>';

  body.setInnerHtml('''
<div id="x">$html</div>
<div id="y"></div>
''', treeSanitizer: new NullTreeSanitizer());
  
  document.getElementById("y").innerHtml = document.getElementById("x").innerHtml;
  
  Expect.equals(2, html.allMatches(body.outerHtml).length);
}

