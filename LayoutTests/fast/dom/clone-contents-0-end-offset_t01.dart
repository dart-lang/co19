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
<!-- This test was derived from a real case inside the Mail application, bug 3812471.-->

<blockquote id="start"><span id="end">Heck, son, you're a failure</span></blockquote>

<p>The result appears below here; should not include any text:</p>

<p id="destination">Original text, should not be seen.</p>

    ''', treeSanitizer: new NullTreeSanitizer());

  var start = document.getElementById("start");
  var end = document.getElementById("end");
  var destination = document.getElementById("destination");

  var r = document.createRange();
  r.setStart(start, 0);
  r.setEnd(end, 0);

  shouldBeTrue(document.body.text.contains('Original'));

  while (destination.firstChild != null)
    destination.firstChild.remove();
  destination.append(r.cloneContents());

  shouldBeFalse(document.body.text.contains('Original'));
}

