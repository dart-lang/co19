/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description 
 */
import "dart:html";
import "../../../Utils/expect.dart";

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();
    evaluator.evaluate("//a[@id='']",document, null, XPathResult.STRING_TYPE, null);
}
