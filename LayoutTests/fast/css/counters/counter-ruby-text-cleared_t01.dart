/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>* {counter-increment: x;}</style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <ruby>
          <rt></rt>
          <div></div>
      </ruby>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    document.body.innerHtml = "PASS: Clearing ruby text with counters does not crash.";
    asyncEnd();
  });
}
