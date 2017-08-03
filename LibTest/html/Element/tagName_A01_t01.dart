/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String tagName
 * The name of the tag for the given element.
 * @description Checks all valid html5 tags
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  for (var element in Html5Elements) {
    Expect.equals(element.toUpperCase(), new Element.tag(element).tagName);
  }
}
