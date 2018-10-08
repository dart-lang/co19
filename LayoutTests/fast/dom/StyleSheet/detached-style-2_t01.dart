/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Bug 45205: Test that <link> elements only have stylesheets
 * when in document.
 */
import "dart:html";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  LinkElement link = new Element.html('''
    <link rel="stylesheet" href="$root/resources/detached-style.css" type="text/css" media="screen">
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(link);

  document.body.setInnerHtml('''
    <p><a href="https://bugs.webkit.org/show_bug.cgi?id=45205">Bug 45205</a>:
    Test that &lt;link> elements only have stylesheets when in document.</p>
    ''', treeSanitizer: new NullTreeSanitizer());

  var head = document.getElementsByTagName("head")[0];

  link.remove();

  asyncStart();
  window.onLoad.listen((_) {
    shouldBeNull(link.sheet);

    debug('After adding to document');
    head.append(link);
    shouldBeNonNull(link.sheet);
    asyncEnd();
  });
}


