/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that the naturalWidth and naturalHeight 
 * HTMLImageElement properties work correctly.
 */
import "dart:html";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
    <img id="image1" src="$root/resources/blue_rect.jpg">
    <img id="image2" width="10" height="10" src="$root/resources/blue_rect.jpg">
    <img id="image3" src="IntentionallyMissingFile.jpg">
    <img id="image4" src="IntentionallyMissingFile.jpg" width="10" height="10">
    ''', treeSanitizer: new NullTreeSanitizer());

  ImageElement i1 = document.getElementById('image1');
  i1.onLoad.listen((_) {
    debug('i1.naturalWidth');
    shouldBe(i1.naturalWidth, 75);
    debug('i1.naturalHeight');
    shouldBe(i1.naturalHeight, 25);
    asyncEnd();
  });
  asyncStart();

  ImageElement i2 = document.getElementById('image2');
  i2.onLoad.listen((_) {
    debug('i2.naturalWidth');
    shouldBe(i2.naturalWidth, 75);
    debug('i2.naturalHeight');
    shouldBe(i2.naturalHeight, 25);
    asyncEnd();
  });
  asyncStart();

  ImageElement i3 = document.getElementById('image3');
  i3.onError.listen((_) {
    debug('i3.naturalWidth');
    shouldBe(i3.naturalWidth, 0);
    debug('i3.naturalHeight');
    shouldBe(i3.naturalHeight, 0);
    asyncEnd();
  });
  asyncStart();

  ImageElement i4 = document.getElementById('image4');
  i4.onError.listen((_) {
    debug('i4.naturalWidth');
    shouldBe(i4.naturalWidth, 0);
    debug('i4.naturalHeight');
    shouldBe(i4.naturalHeight, 0);
    asyncEnd();
  });
  asyncStart();
}
