/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 * This page preloads 2 images in an onLoad function.
 * The image object.src is expected to be the full path to the image, relative
 * to the document base.
 * To match WinIE (but not FireFox), we resolve the image path in the getter,
 * rather than the setter, allowing for pages to change the Document base URL
 * via javascript and have object.src reflect said change.
 */
import "dart:html";
import "dart:async";
import "../../../testcommon.dart";

main() {
  document.head.append(new Element.html('''
    <base id="foo" href="file:///does/not/exist/">
    ''', treeSanitizer: new NullTreeSanitizer()));

  document.body.setInnerHtml('''
    <image id="grey" name="grey" src="" style="display: none">
    <div style="font-size:small" id="before"></div>
    <p>After changing the base URL:</p>
    <div style="font-size:small" id="after"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  ImageElement grey = document.getElementById("grey");
  var foo = document.getElementById("foo");

  asyncStart();
  grey.onError.first.then((_) {
    ImageElement img = new Element.html('<img width="129" height="35">');

    img.src = "test.jpg";
    grey.src = img.src;

    asyncStart();
    Future.wait([img.onError.first, grey.onError.first]).then((_) {
      debug('before');
      shouldBe(grey.src, "file:///does/not/exist/test.jpg");
      shouldBe(img.src, "file:///does/not/exist/test.jpg");

      foo.setAttribute("href",
        "file:///also/does/not/exist/");
      debug('after');
      shouldBe(grey.src, "file:///does/not/exist/test.jpg");
      shouldBe(img.src, "file:///also/does/not/exist/test.jpg");
      asyncEnd();
    });
    asyncEnd();
  });
}
