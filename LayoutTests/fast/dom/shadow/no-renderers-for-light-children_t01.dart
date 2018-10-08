/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Children of an element are never rendered is it has a shadow
 * DOM subtree.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <keygen></keygen>
    ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.addEventListener('load', (_) {
    document.getElementsByTagName('keygen')[0].append(new Text('FAIL'));
    asyncEnd();
  }, false);
}
