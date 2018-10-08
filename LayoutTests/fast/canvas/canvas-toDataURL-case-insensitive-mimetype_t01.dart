/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that toDataUrl(mimeType) ignores the case of 'mimeType'.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  dynamic canvas = document.createElement('canvas');

  tryMimeType(mimeType) {
    var re = new RegExp(r"^data:([^;,]+)[;,].*");
    var data = canvas.toDataUrl(mimeType);
    var match = re.firstMatch(data);
    shouldBe(match.groupCount, 1);
    return match.group(1);
  }

  shouldBe(tryMimeType('image/png'), 'image/png');
  shouldBe(tryMimeType('iMAge/Png'), 'image/png');
  shouldBe(tryMimeType('IMAGE/PNG'), 'image/png');

  //if (tryMimeType("image/jpeg") == "image/jpeg") {
    shouldBe(tryMimeType('image/jpeg'), 'image/jpeg');
    shouldBe(tryMimeType('imAgE/jPEg'), 'image/jpeg');
    shouldBe(tryMimeType('IMAGE/JPEG'), 'image/jpeg');
  //}
}
