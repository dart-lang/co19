/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that a document only supports one document element.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  shouldThrow(() {
    document.append(
      document.createElementNS("http://www.w3.org/1999/xhtml", "html"));
  }, (e) => e is DomException && e.name == DomException.HIERARCHY_REQUEST);
}
