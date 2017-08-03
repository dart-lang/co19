/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isTagSupported(String tag)
 * Checks to see if the tag name is supported by the current platform.
 * The tag should be a valid HTML tag name.
 * @description Checks that all valid html5 tags are supported.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  for (var element in Html5Elements) {
    Expect.isTrue(Element.isTagSupported(element), "$element is not supported");
  }
}
