/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description document.activeElement should return a valid and focusable element.
 * @needsreview
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id=holder>
      <input autofocus id=willBeRemoved>
      <input autofocus id=willBeDisabled>
      </div>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.body.id = 'body';

  InputElement willBeRemoved = document.getElementById('willBeRemoved');
  InputElement willBeDisabled = document.getElementById('willBeDisabled');

  document.addEventListener("DOMFocusOut", (_) {
    willBeRemoved.remove();
    willBeDisabled.disabled = true;
    asyncEnd();
  }, false);

  shouldNotBe(document.activeElement, willBeDisabled);
  shouldBeEqualToString(document.activeElement.id, "body");

  asyncStart();
  willBeDisabled.remove();
}
