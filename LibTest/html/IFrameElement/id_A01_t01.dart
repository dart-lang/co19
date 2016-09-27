/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String id
 * Gets/sets the id of the element.
 * @description Checks expected attribute settings
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement iframe = new Element.html('<iframe id="foo">Content</iframe>');
  Expect.equals('foo', iframe.id);

  iframe.id = 'bar';
  Expect.equals('bar', iframe.attributes['id']);
}
