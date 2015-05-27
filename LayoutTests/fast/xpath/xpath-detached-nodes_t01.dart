/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description This tests XPath expressions on detached document fragments and nodes.
 * See https://bugs.webkit.org/show_bug.cgi?id=36427
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

void main() {
  XPathEvaluator evaluator=new XPathEvaluator();

  var frag = document.createDocumentFragment();
  var child = document.createElement('div');
  frag.append(child);
  child.append(document.createElement('h2'));
  shouldBe(evaluator.evaluate('count(/div)', child, null, XPathResult.NUMBER_TYPE, null).numberValue,
           1);
  shouldBe(evaluator.evaluate('count(/html)', child, null, XPathResult.NUMBER_TYPE, null).numberValue,
           0);
  shouldBe(evaluator.evaluate('count(/)', child, null, XPathResult.NUMBER_TYPE, null).numberValue,
           1);
  shouldBe(evaluator.evaluate('count(//html)', child, null, XPathResult.NUMBER_TYPE, null).numberValue,
           0);
  shouldBe(evaluator.evaluate('count(//div)', child, null, XPathResult.NUMBER_TYPE, null).numberValue,
           1);
  shouldBe(evaluator.evaluate('count(//h2)', child, null, XPathResult.NUMBER_TYPE, null).numberValue,
           1);

  var ele = document.createElement('p');
  ele.append(document.createElement('h1'));
  shouldBe(evaluator.evaluate('count(/h1)', ele, null, XPathResult.NUMBER_TYPE, null).numberValue,
           1);
  shouldBe(evaluator.evaluate('count(/html)', ele, null, XPathResult.NUMBER_TYPE, null).numberValue,
           0);
  shouldBe(evaluator.evaluate('count(/)', ele, null, XPathResult.NUMBER_TYPE, null).numberValue,
           1);
  shouldBe(evaluator.evaluate('count(//html)', ele, null, XPathResult.NUMBER_TYPE, null).numberValue,
           0);
  shouldBe(evaluator.evaluate('count(//p)', ele, null, XPathResult.NUMBER_TYPE, null).numberValue,
           0);
  shouldBe(evaluator.evaluate('count(//h1)', ele, null, XPathResult.NUMBER_TYPE, null).numberValue,
           1);
  shouldBe(evaluator.evaluate('/* | *', ele, null, XPathResult.NUMBER_TYPE, null).numberValue,
           NaN);
}

