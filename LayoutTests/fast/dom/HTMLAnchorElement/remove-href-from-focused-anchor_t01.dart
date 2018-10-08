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
  document.body.append(new Element.html('''
    <a href="javascript:" id="target">link</a>
    ''', treeSanitizer: new NullTreeSanitizer()));

  debug('Active');
  var target = document.getElementById('target');
  target.focus();
  shouldBe(document.activeElement, target);

  debug('Remove href.');
  asyncStart();
  target.addEventListener('blur', (_) {
    asyncEnd();
    target.remove();
  }, false);

  setTimeout(() {
    target.attributes.remove('href');
  }, 10);
}
