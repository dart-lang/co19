/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests the behavior of Range::isPointInRange when the point
 * and the range are in different documents.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var docType = document.implementation.createDocumentType ('html', '', '');
  var doc = document.implementation.createDocument('', 'html', docType);
  var body = document.createElement('body');  
  doc.documentElement.append(body);
  var testContainer = document.createElement('span');
  testContainer.append(new Text('Test container'));
  body.append(testContainer);

  var range = document.createRange();
  range.selectNode(testContainer);
  var testNode = document.createElement('p');
  testNode.append(new Text('Test node'));
  document.body.append(testNode);

  Expect.isFalse(range.isPointInRange(testNode, 1));

  testNode.remove();
}
