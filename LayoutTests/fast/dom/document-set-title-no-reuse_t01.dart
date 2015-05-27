/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * @description Test that setting document.title does not reuse title's
 * textnode child
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.title = "aaa";
  var oldnode = document.getElementsByTagName("title")[0].firstChild;
  document.title = "bbb";
  shouldBeTrue(oldnode.text != "bbb");
  shouldBeTrue(oldnode != document.getElementsByTagName("title")[0].firstChild);
}
