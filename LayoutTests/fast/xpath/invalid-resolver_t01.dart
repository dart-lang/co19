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
import "xpath-test-pre.dart";

// to cheat the analyzer
Object toObject(var res) {
   return res;
}
void main() {
    XPathEvaluator evaluator=new XPathEvaluator();

    shouldThrow((){
        evaluator.evaluate('/body', document, toObject(5), 0, null);
    }
    , (e) => e is TypeError || e.toString().contains("TypeError")
    , "resolver is a number");

    shouldThrow(() {
        evaluator.evaluate('/body', document, toObject('a resolver'), 0, null);
    }
    , (e) => e is TypeError || e.toString().contains("TypeError")
    , "resolver is a String");

//    shouldBe(evaluator.evaluate('/body', document, Date, 0, null).toString(), "[object XPathResult]"); - why Date works in js?

    checkTestFailures();
}
