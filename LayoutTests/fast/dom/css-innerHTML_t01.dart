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
  /*
  var e = document.createElement('style');
  e.setInnerHtml("<p>foobar</p>", // yes, that's invalid CSS
    treeSanitizer: new NullTreeSanitizer());
  document.body.append(e);

  // If it were parsed, it would have been just "foobar".
  shouldBe(e.text, "<p>foobar</p>");
  */

  // in dart innerHtml= on style is not supported

  var e = document.createElement('style');

  shouldThrow(() {
    e.setInnerHtml("<p>foobar</p>", treeSanitizer: new NullTreeSanitizer());
  });
}
