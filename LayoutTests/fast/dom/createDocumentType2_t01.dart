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
  shouldThrow(() {
    document.append(document.implementation
      .createDocumentType("example", "http://www.example.com/", "myDoc.dtd"));
  }, (e) => e is DomException && e.name == DomException.HIERARCHY_REQUEST);
}
