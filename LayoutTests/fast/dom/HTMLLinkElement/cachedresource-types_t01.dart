/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test passes if it does not crash.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.documentElement.append(new Element.html(
        '<link rel="subresource" href="IntentionallyMissingFile.jpg"/>',
        treeSanitizer: new NullTreeSanitizer()));
  document.documentElement.append(new Element.html(
        '<img src="IntentionallyMissingFile.jpg">',
        treeSanitizer: new NullTreeSanitizer()));
}


