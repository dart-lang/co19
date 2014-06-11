/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that removing a possibly style sheet-carrying
 * element from an unrendered document does not leave behind a reference to a
 * stale object and lead to a crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var otherDocument = document.implementation.createHtmlDocument('');
  otherDocument.documentElement.innerHtml = "<link>";
  otherDocument.documentElement.innerHtml = "";
  otherDocument.documentElement
    .append(otherDocument.createElement("head"))
    .append(otherDocument.createElement("style"));
}
