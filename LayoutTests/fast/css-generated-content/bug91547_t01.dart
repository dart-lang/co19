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
  var style = new Element.html('''
      <style>
          section::after {
              float: left;
              content: open-quote; 
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <section>
          <div></div>
          Should not crash.
      </section>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    if (window.location.hash != "#1") {
      window.location.hash = '#1';
      setTimeout(() { window.location.reload(); }, 0);
    } else {
      // If you run this test in Safari you'll still see this text even if Webkit crashed
      // because Safari instantly reloads the page with the #1 url.
      document.body.append(new Text('PASS: WebKit did not crash.'));
      asyncEnd();
    }
  });
}
