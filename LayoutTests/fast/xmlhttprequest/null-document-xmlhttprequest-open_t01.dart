/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This test checks for a NULL document crash that can happen when calling
 * XMLHttpRequest.open.
 */
import "dart:html";
import "../../testcommon.dart";

const String htmlEL = r'''
<pre id="pre"></pre>
''';

void log(String s) {
    print(s);
    document.getElementById("pre").append(new Text(s));
}

void checkPass(event) {
  if (event.target.readyState == 1) { 
    log("PASS: You didn't crash.");
    asyncEnd();
  }
}

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
  var request = new HttpRequest();
  asyncStart();
  request.onReadyStateChange.listen(checkPass);
  request.open("GET", "does-not-exist.bogus", async:true);
}
