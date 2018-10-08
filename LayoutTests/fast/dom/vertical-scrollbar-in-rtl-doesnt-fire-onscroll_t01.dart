/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that when a page with an RTL overflow is initially
 * loaded, no scroll event is sent.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.onScroll.listen((_) => testFailed('FAIL'));

  asyncStart();

  document.documentElement.dir = 'rtl';
  document.documentElement
    .setAttribute('style', "-webkit-writing-mode:vertical-lr");

  document.body.setInnerHtml('''
      <div dir=ltr>
      </div>
      <div id="div" style="whitespace:nowrap; width: 1000px; height: 4000px; border: 1px solid red;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</div>
      <ul id="console"></ul>
      ''', treeSanitizer: new NullTreeSanitizer());

  window.onLoad.listen((_) => asyncEnd());
}
