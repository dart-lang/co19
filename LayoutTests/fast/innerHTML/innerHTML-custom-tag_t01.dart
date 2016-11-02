/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description HTML innerHTML test, including custom tags
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  BodyElement body = document.body;

  body.setInnerHtml('''
    <span>Content:</span>
    <pre id="content">placeholder</pre>
    <div></div>
    <span></span>
    <b>test</b>
    <br>
    <emptyCustomTag></emptyCustomTag>
    <customTag>more test</customTag>
    <div id="testArea"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  Node n = document.getElementsByTagName("emptyCustomTag")[0];
  n.parentNode.insertBefore(
    document.createElementNS("http://webkit.org/test", "anotherEmptyCustomTag"),
    n.nextNode);
  n.parentNode.insertBefore(new Text("\n"), n.nextNode);
  document.getElementById("content").firstChild.text = document.body.innerHtml;

  Expect.equals('<anotherEmptyCustomTag></anotherEmptyCustomTag>',
  (n as Element).nextElementSibling.outerHtml);
}

