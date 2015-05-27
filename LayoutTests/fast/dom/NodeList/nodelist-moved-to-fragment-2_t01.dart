/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p>This tests moving a node list that uses string gets adopted to a new document properly.<br>
    The test passes if WebKit does not hit an assertion.</p>
    ''', treeSanitizer: new NullTreeSanitizer());

  var newDocument = document.implementation.createDocument(null, "someElement", null);
  var fragment = document.createDocumentFragment();
  newDocument.documentElement.getElementsByClassName("foo");
  fragment.append(newDocument.documentElement);

  setTimeout(() {
    document.querySelector('p').innerHtml += '<br><br>PASS';
  }, 0);
}
