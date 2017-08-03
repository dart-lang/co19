/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isTagSupported(String tag)
 * Checks to see if the tag name is supported by the current platform.
 * The tag should be a valid HTML tag name.
 * @description Checks that valid custom element tag name is supported.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(Element.isTagSupported('foo-bar-123'));
}
