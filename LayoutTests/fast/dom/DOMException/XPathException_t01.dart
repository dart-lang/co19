/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests the properties of the exception thrown when using XPath.
 */
import "dart:html";
import "../../../../Utils/expect.dart";

main() {
  var evalulator = new XPathEvaluator();
  var nsResolver = evalulator.createNSResolver(document);
  var result = evalulator.evaluate("/body", document, nsResolver, 0, null);
  Expect.throws(() {
    // raises a TYPE_ERR
    var num = result.numberValue;
  }, (e) => e is DomException && e.name == 'TypeError'); 
}

