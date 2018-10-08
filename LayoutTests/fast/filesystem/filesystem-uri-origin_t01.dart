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
      <a style="display:none" href="filesystem:http://www.webkit.org:8080/temporary/a/b/c/file.txt">foo</a>
      ''', treeSanitizer: new NullTreeSanitizer());

  var expectedOrigin = 'http://www.webkit.org:8080';
  AnchorElement a = document.body.querySelector('a');
  var actualOrigin = a.origin;
  shouldBe(actualOrigin, expectedOrigin);
}
