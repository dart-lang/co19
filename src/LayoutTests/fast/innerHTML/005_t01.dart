/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests html output
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var doc = document.implementation.createHtmlDocument('test');
  var body = doc.body;
  var html = '''
<span>Content:</span>
<pre id="content">placeholder</pre>
<div></div>
<span></span>
<b>test</b>
<br>''';

  body.setInnerHtml(html, treeSanitizer: new NullTreeSanitizer());

  Expect.equals('<head><title>test</title></head><body>$html</body>',
      doc.documentElement.innerHtml);
}

