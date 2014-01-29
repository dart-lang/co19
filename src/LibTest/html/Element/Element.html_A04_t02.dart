/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Element.html(String html, {NodeValidator validator,
 *  NodeTreeSanitizer treeSanitizer})
 * Unless a validator is provided this will perform the default validation
 * and remove all scriptable elements and attributes.
 * @description Checks custom validation.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<foo></foo>',
      validator: new NodeValidatorBuilder()..allowElement('foo'));
  Expect.equals('FOO', x.tagName);
}
