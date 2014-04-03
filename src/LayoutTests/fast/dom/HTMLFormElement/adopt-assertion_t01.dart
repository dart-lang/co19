/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 *  Test for https://bugs.webkit.org/attachment.cgi?id=30159
 *  Assertion failure in Node::setDocument()
 *  (willMoveToNewOwnerDocumentWasCalled) when adopting a <form> element.
 *  The test passed if it did not throw.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <form id="target"></form>
    ''', treeSanitizer: new NullTreeSanitizer());

  var otherDocument = document.implementation.createHtmlDocument('');
  otherDocument.adoptNode(document.getElementById("target"));
}
