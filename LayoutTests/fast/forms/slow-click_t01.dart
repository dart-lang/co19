/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that click() on checkboxes is not slow.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <input type=checkbox id=cb>
      ''', treeSanitizer: new NullTreeSanitizer());

  var starttime = new DateTime.now();
  var cb = document.getElementById('cb');
  for (var n=0; n<100; n++) {
    cb.click();
  }
  var diff = new DateTime.now().difference(starttime).inMilliseconds;
  shouldBeTrue(diff < 2000);
}
