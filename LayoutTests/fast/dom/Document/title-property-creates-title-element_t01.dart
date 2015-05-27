/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that setting document.title creates a title element and
 * appends it to the documents head if one does not already exist, as per
 * http://whatwg.org/specs/web-apps/current-work/#the-title1
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var parser = new DomParser();
  var doc = parser.parseFromString('<!DOCTYPE html><head></head><body></body>',
      'text/html');
  Expect.equals(0, doc.getElementsByTagName('title').length);
  doc.title = 'Document title';
  Expect.equals(1, doc.getElementsByTagName('title').length);
}
