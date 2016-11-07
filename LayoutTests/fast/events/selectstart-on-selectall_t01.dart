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
      <p>This test ensures selectstart event fires when selecting all.</p>
      ''', treeSanitizer: new NullTreeSanitizer());

  var targetWasBody = true;
  var handlerCount = 0;
  var listenerCount = 0;

  handler(event) {
    if (event.target != document.body)
      targetWasBody = false;
    handlerCount++;
  }

  document.body.onSelectStart.listen(handler);

  document.body.addEventListener('selectstart', (event) {
    if (event.target != document.body)
      targetWasBody = false;
    listenerCount++;
  });

  document.execCommand('SelectAll', false, null);

  debug('handlerCount');
  shouldBe(handlerCount, 1);
  debug('listenerCount');
  shouldBe(listenerCount, 1);
  shouldBeTrue(targetWasBody);
}
