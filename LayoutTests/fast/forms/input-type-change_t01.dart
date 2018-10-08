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
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <p>Test the changing of an input type=TEXT to type=IMAGE, and vice versa. This test is to make sure that
      the height and width attributes are used for only IMAGE type.</p>
      <div id=console></div>
      <form id=parent>
      <input id="text" type="text" src="$root/resources/apple.gif" height="17" width="19">
      <input id="image" type="image" src="$root/resources/apple.gif" height="17" width="19">
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  InputElement text = document.getElementById('text') as InputElement;
  InputElement image = document.getElementById('image') as InputElement;

  change(_) {
    debug('Check metrics before the change:');
    shouldNotBe(text.offsetWidth, 19);
    shouldNotBe(text.offsetHeight, 17);
    shouldBe(image.offsetWidth, 19);
    shouldBe(image.offsetHeight, 17);

    text.type = 'image';
    image.type = 'text';
    debug('Check metrics after the change:');
    shouldBe(text.offsetWidth, 19);
    shouldBe(text.offsetHeight, 17);
    shouldNotBe(image.offsetWidth, 19);
    shouldNotBe(image.offsetHeight, 17);

    document.getElementById('parent').remove();
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(change);
}
