/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description createElement('a:b') in HTML
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var got = document.createElement('a:b').localName;
  var expected = 'a:b';
  shouldBe(got, expected);
}
