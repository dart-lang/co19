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
  var f = new DocumentFragment.html('''
      <style>
      .s1::before { display: table; content: counter(section); }
      .s2::after { display: table; content: counter(section); }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''PASS unless crash.
      ''', treeSanitizer: new NullTreeSanitizer());

  boom(_) {
    var s1 = document.createElement('select');
    s1.setAttribute('class', 's1');
    document.documentElement.append(s1);
    var s2 = document.createElement('select');
    s2.setAttribute('class', 's2');
    document.documentElement.append(s2);
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(boom);
}
