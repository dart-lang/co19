/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after LayoutTests/fast/xpath/4XPath/Core/test_parser.html
 * @description 
 */
import "dart:html";
import "../../xpath-test-pre.dart";
import "test.dart";

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();
    var result;
    
    String nsResolver(prefix) {
        if (prefix == 'x')
            return 'http://spam.com';
        return null;
    }

    result = evaluator.evaluate("child::*", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("child::*", result, CHILDREN);

    result = evaluator.evaluate("/child::*", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("/child::*", result, [ROOT]);

    result = evaluator.evaluate("/*/*", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("/*/*", result, CHILDREN);

    result = evaluator.evaluate("/child::*/*/child::GCHILD", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("/child::*/*/child::GCHILD", result, new List.from(GCHILDREN1)..addAll(GCHILDREN2));

    result = evaluator.evaluate("//*", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
//  was:  checkSnapshot("//*", result, [ROOT, CHILD1].concat(GCHILDREN1, [CHILD2], GCHILDREN2, [CHILD3, LANG], LCHILDREN));
    List expected=new List.from([ROOT, CHILD1])..addAll(GCHILDREN1)..add(CHILD2)..addAll(GCHILDREN2)..add(CHILD3)..add(LANG)..addAll(LCHILDREN);
    checkSnapshot("//*", result, expected);

    result = evaluator.evaluate("//GCHILD", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("//GCHILD", result, new List.from(GCHILDREN1)..addAll(GCHILDREN2));

    result = evaluator.evaluate("//@attr1", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
 //   checkSnapshot("//@attr1", result, [ATTR1, ATTR2]);

 //   result = evaluator.evaluate("x:GCHILD", CHILD1, nsResolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
  //  checkSnapshot("x:GCHILD", result, []);

    result = evaluator.evaluate(".//GCHILD", CHILD2, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot(".//GCHILD", result, GCHILDREN2);

    result = evaluator.evaluate(".//GCHILD", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot(".//GCHILD", result, new List.from(GCHILDREN1)..addAll(GCHILDREN2));

    result = evaluator.evaluate("/", text, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("/", result, [DOM]);

    result = evaluator.evaluate("//CHILD1/..", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("//CHILD1/..", result, [ROOT]);

//    result = evaluator.evaluate(".//foo:*", CHILD3, DOM.createNSResolver(CHILD3), XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
//    checkSnapshot(".//foo:*", result, []);

    result = evaluator.evaluate("CHILD1 | CHILD2", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("CHILD1 | CHILD2", result, [CHILD1, CHILD2]);

    result = evaluator.evaluate("descendant::GCHILD[3]", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("descendant::GCHILD[3]", result, [GCHILD21]);

    result = evaluator.evaluate("descendant::GCHILD[parent::CHILD1]", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("descendant::GCHILD[parent::CHILD1]", result, GCHILDREN1);

    result = evaluator.evaluate("descendant::GCHILD[position() > 1]", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("descendant::GCHILD[position() > 1]", result, new List.from([GCHILD12])..addAll(GCHILDREN2));

    result = evaluator.evaluate("@attr1[.='val1']", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("@attr1[.='val1']", result, [ATTR1]);

    shouldBe(evaluator.evaluate("1", ROOT, null, XPathResult.ANY_TYPE, null).numberValue, 1);
    shouldBe(evaluator.evaluate("00200", ROOT, null, XPathResult.ANY_TYPE, null).numberValue, 200);
    shouldBe(evaluator.evaluate("3+4*7", ROOT, null, XPathResult.ANY_TYPE, null).numberValue, 31);
    shouldBe(evaluator.evaluate("3-4*1", ROOT, null, XPathResult.ANY_TYPE, null).numberValue, -1);
    shouldBe(evaluator.evaluate("string(\'1\')", ROOT, null, XPathResult.ANY_TYPE, null).stringValue, '1');
    shouldBe(evaluator.evaluate("concat(\'1\', \'2\')", ROOT, null, XPathResult.ANY_TYPE, null).stringValue, '12');
    shouldBe(evaluator.evaluate("true()", ROOT, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("false()", ROOT, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("1=3<4", ROOT, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("1 or 2 and 3", ROOT, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("1 and 2 = 3", ROOT, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("-1 or 2", ROOT, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate(". or *", ROOT, null, XPathResult.ANY_TYPE, null).booleanValue, true);

    result = evaluator.evaluate("text()", CHILD3, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("text()", result, []);

    result = evaluator.evaluate("processing-instruction('f')", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("processing-instruction('f')", result, []);

    result = evaluator.evaluate("(child::*)", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("(child::*)", result, CHILDREN);

    shouldBe(evaluator.evaluate(". * 0", ROOT, null, XPathResult.NUMBER_TYPE, null).numberValue, NaN);
    shouldBe(evaluator.evaluate(".. * 0", ROOT, null, XPathResult.NUMBER_TYPE, null).numberValue, NaN);
    shouldBe(evaluator.evaluate("/.. * 0", ROOT, null, XPathResult.NUMBER_TYPE, null).numberValue, NaN);

    result = evaluator.evaluate("CHILD2/@CODE", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("CHILD2/@CODE", result, [IDATTR2]);

    shouldBe(evaluator.evaluate("CHILD2/@CODE * 0", ROOT, null, XPathResult.NUMBER_TYPE, null).numberValue, 0);

    result = evaluator.evaluate("f\xf6\xf8", LANG, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("f\xf6\xf8", result, [NONASCIIQNAME]);

    shouldThrow((){
        evaluator.evaluate("\\\\", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    });
    
    checkTestFailures();    
}
