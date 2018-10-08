/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test verifies that an image which is prefetched, and 
 * which is also contained as a subresource of the current document can be
 * loaded correctly as a subresource.  See bug 49236 in which this wasn't
 * working.
 */
import "dart:html";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
    <link rel="prefetch" href="$root/resources/nick.jpg"/>
    <img src="$root/resources/nick.jpg"/>
    ''', treeSanitizer: new NullTreeSanitizer());

  var nick_load_count = 0;

  nick_onload(_)
  {
    ++nick_load_count;
    if (nick_load_count == 2) {
      asyncEnd();
    }
  }

  asyncStart();
  document.body.querySelector('link').onLoad.listen(nick_onload);
  document.body.querySelector('img').onLoad.listen(nick_onload);
}
