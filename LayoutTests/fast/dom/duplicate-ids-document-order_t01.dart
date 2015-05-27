/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that getElementById returns the first element in
 * document order when there are multiple ids. Bug 12988.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div style="display:none" id="foo">text</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var div = document.getElementById("foo");
  for (var i = 0; i < 5; ++i) {
    var span = document.createElement("span");
    span.append(new Text(i.toString()));
    span.setAttribute("id", "bar");
    div.insertBefore(span, div.firstChild);
  }

  shouldBe(document.getElementById("bar").innerHtml, '4');
}
