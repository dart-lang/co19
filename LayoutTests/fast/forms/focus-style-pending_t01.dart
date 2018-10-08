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
      <link rel=stylesheet href="data:text/css,bogus{}">
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      Test that focus() sets input focus correctly even when there are pending stylesheet loads.<br>
      <input id=t>
      ''', treeSanitizer: new NullTreeSanitizer());

  var t = document.getElementById('t');
  t.onFocus.listen((_) => asyncEnd());
  asyncStart();
  t.focus();
}
