/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after LayoutTests/fast/xpath/4XPath/Core/test_core_functions.html
 * @description 
 */
import "dart:html";
import "../../../../../Utils/expect.dart";
import "../../xpath-test-pre.dart";
import "test.dart";

class MyXPathNSResolver implements XPathNSResolver {
    String lookupNamespaceUri(String prefix) {
        if (prefix == 'f')
            return 'http://foo.com';
        Expect.fail("Unexpected prefix:$prefix");
        return null;
    }
}

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();
    
    XPathNSResolver nsResolver = new MyXPathNSResolver();

    shouldBe(evaluator.evaluate("last()", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 1);
    shouldBe(evaluator.evaluate("position()", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 1);
    shouldBe(evaluator.evaluate("count(/ROOT | /ROOT/CHILD1)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 2);

    XPathResult result = evaluator.evaluate("id(1)", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("id(1)", result, [CHILD2]);

    result = evaluator.evaluate("id('1 1')", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("id('1 1')", result, [CHILD2]);

    result = evaluator.evaluate("id('0')", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("id('0')", result, []);

    result = evaluator.evaluate("id('0 1')", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("id('0 1')", result, [CHILD2]);

    result = evaluator.evaluate("id('0 1 1')", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("id('0 1 1')", result, [CHILD2]);

    result = evaluator.evaluate("id('0 0 1 1')", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("id('0 0 1 1')", result, [CHILD2]);

    shouldBe(evaluator.evaluate("local-name(/empty)", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "");
    shouldBe(evaluator.evaluate("namespace-uri(/empty)", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "");

    String strNodeset3 = "            Text1  ";

    shouldBe(evaluator.evaluate("string(//CHILD1)", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, strNodeset3);
    shouldBe(evaluator.evaluate("concat(//CHILD1, \'3.14\', \'Hi\')", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, strNodeset3 + "3.14Hi");
    shouldBe(evaluator.evaluate("starts-with(//CHILD1, \'3.14\')", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("starts-with(//CHILD1, //CHILD1)", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("starts-with(//CHILD1, \'\')", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("contains(//CHILD1, \'3.14\')", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("contains(//CHILD1, //CHILD1)", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("contains(//CHILD1, \'\')", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("substring-before(\'3.14Hi\', \'Hi\')", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "3.14");
    shouldBe(evaluator.evaluate("substring-before(\'3.14Hi\', \'\')", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "");
    shouldBe(evaluator.evaluate("substring-after(\'3.14Hi\', \'3.14\')", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "Hi");
    shouldBe(evaluator.evaluate("substring-after(\'3.14Hi\', \'\')", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "3.14Hi");
    shouldBe(evaluator.evaluate("substring(\'3.14Hi\', \'3.14\')", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "14Hi");
    shouldBe(evaluator.evaluate("substring(\'3.14Hi\', \'3.14\', 1)", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "1");
    shouldBe(evaluator.evaluate("substring(\'12345\', 2, 3)", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "234");
    shouldBe(evaluator.evaluate("substring(\'12345\', 2)", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "2345");
    shouldBe(evaluator.evaluate("substring(\'12345\', 1.5, 2.6)", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "234");
    shouldBe(evaluator.evaluate("substring(\'12345\', 0, 3)", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "12");
    shouldBe(evaluator.evaluate("substring(\'12345\', number(\'double.nan\'), 3)", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "");
    shouldBe(evaluator.evaluate("substring(\'12345\', 1, number(\'double.nan\'))", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "");
    shouldBe(evaluator.evaluate("substring(\'12345\', -42, 1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "12345");
    shouldBe(evaluator.evaluate("substring(\'12345\', -1 div 0, 1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "");
    shouldBe(evaluator.evaluate("string-length(\'3.14Hi\')", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 6);
    shouldBe(evaluator.evaluate("normalize-space(\'Ht    \t There\t   Mike\')", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "Ht There Mike");
    shouldBe(evaluator.evaluate("translate(\'Ht    \t There\t   Mike\', \'abcdefg\', \'ABCDEFG\')", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "Ht    \t ThErE\t   MikE");
    shouldBe(evaluator.evaluate("translate(\'hello world\', \'e\', \'a\')", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "hallo world");
    shouldBe(evaluator.evaluate("translate(\'hello world\', \'e\', \'abc\')", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "hallo world");
    shouldBe(evaluator.evaluate("translate(\'hello world\', \'el\', \'a\')", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "hao word");
    shouldBe(evaluator.evaluate("translate(\'hello world\', \'abcdefgabc\', \'ABCDEFG123\')", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "hEllo worlD");
    shouldBe(evaluator.evaluate("translate(\'hello world\', \'abcdefghhe\', \'ABCDEFGH\')", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "HEllo worlD");
    shouldBe(evaluator.evaluate("translate(\'hello world\', \'abcdefgh\', \'\')", CHILD1, null, XPathResult.ANY_TYPE, null).stringValue, "llo worl");

    shouldBe(evaluator.evaluate("boolean(\'3.14\')", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("not(\'3.14Hi\')", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("true()", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("false()", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);

    shouldBe(evaluator.evaluate("number(\'double.nan\')", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("floor(3.14)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 3);
    shouldBe(evaluator.evaluate("floor(number())", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("floor(1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.infinity);
    shouldBe(evaluator.evaluate("floor(-1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -double.infinity);
    shouldBe(evaluator.evaluate("floor(0.5)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 0);
    shouldBe(evaluator.evaluate("floor(-0.5)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -1);
    shouldBe(evaluator.evaluate("ceiling(3.14)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 4);
    shouldBe(evaluator.evaluate("ceiling(number(\'double.nan\'))", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("ceiling(1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.infinity);
    shouldBe(evaluator.evaluate("ceiling(0.5)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 1);
    shouldBe(evaluator.evaluate("ceiling(-0.5)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -0);
    shouldBe(evaluator.evaluate("round(3.14)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 3);
    shouldBe(evaluator.evaluate("round(-4.5)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -4);
    shouldBe(evaluator.evaluate("round(number(\'double.nan\'))", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("round(1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.infinity);
    shouldBe(evaluator.evaluate("round(-1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -double.infinity);
    shouldBe(evaluator.evaluate("round(\'12345\')", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 12345);
    shouldBe(evaluator.evaluate("lang(\'en\')", LCHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("lang(\'en\')", LCHILD2, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("lang(\'\')", LCHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("lang(\'\')", LCHILD2, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("lang(\'foo\')", LCHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("lang(\'foo\')", LCHILD2, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    
    checkTestFailures();
}