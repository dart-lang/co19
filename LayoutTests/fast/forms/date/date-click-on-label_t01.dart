/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check if clicking a label focuses on a date input in it.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <label id="label1">Label: <input type="date" id="date1"></label>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.body.id='body';

  // Force layout because we can't focus on elements without RenderBox.
  document.body.offsetLeft; 
  shouldBeEqualToString(document.activeElement.id, 'body');
  debug('Clicking a label.');
  var clickEvent = new MouseEvent("click", canBubble: true, cancelable: true);
  document.getElementById('label1').dispatchEvent(clickEvent);
  shouldBeEqualToString(document.activeElement.id, 'date1');
}
