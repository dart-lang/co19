/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<String, String> attributes
 * Any modifications to the attribute map will automatically be applied to
 * this element.
 * @description Checks that modification of attributes is reflected in the
 * element.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new Element.html('<iframe id="id"></iframe>');
  Expect.equals('id', x.id);
  Expect.equals(null, x.className);

  Map<String, String> attributes = new Map<String, String>();
  attributes['id'] = 'foo';
  attributes['class'] = 'bar';
  x.attributes = attributes;

  Expect.equals('foo', x.id);
  Expect.equals('bar', x.className);
}
