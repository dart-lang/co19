/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test ensures that we can update the contents of the title
 * tag of the XHTML document when setting document.title
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.querySelector('title').id = 't';
  document.title = 'This is the new title';
  shouldBe(document.getElementById('t').text, 'This is the new title');
}
