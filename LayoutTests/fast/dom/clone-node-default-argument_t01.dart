/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var div = document.createElement('div');
  div.innerHtml = '<a></a>';
  // no default in dart clone
  shouldBeFalse(div.clone(false).hasChildNodes());
  shouldBe(div.clone(false).childNodes.length, 0);
}
