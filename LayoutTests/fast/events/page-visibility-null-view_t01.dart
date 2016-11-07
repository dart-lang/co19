/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks that Page Visibility state values are correct
 * when a document has no defaultView.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var subdocument = document.implementation.createDocument('http://www.w3.org/1999/xhtml', 'html', null);

  //shouldBeTrue(subdocument.defaultView == null);
  shouldBeEqualToString(subdocument.visibilityState, "hidden");
  shouldBeTrue(subdocument.hidden);
}
