/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 * Test fails: "ITEM1 is Text"
 */
import "dart:html";
import "../xpath-test-pre.dart";

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();

{
    Document doc = (new DomParser()).parseFromString(r'''
    <doc>    
        <item id="1" />    
        <item id="2" />    
        <item id="3" />    
        <item id="4" />    
        <item id="5" />    
    </doc>''',
    'application/xml');

var ROOT = doc.documentElement;
var ITEM1 = ROOT.firstChild;
//print("ITEM1 is ${ITEM1.runtimeType}");
var ITEM2 = ITEM1.nextNode;
//print("ITEM2 is ${ITEM2.runtimeType}");
var ITEM3 = ITEM2.nextNode;
//print("ITEM3 is ${ITEM3.runtimeType}");
var ITEM4 = ITEM3.nextNode;
//print("ITEM4 is ${ITEM4.runtimeType}");

test(doc, doc.documentElement, '//item[@id >= 2 and @id <= "4"]', [ITEM2, ITEM3, ITEM4]);
test(doc, doc.documentElement, '//item[@id >= 2 and @id <= 3]', [ITEM2, ITEM3]);
shouldThrow((){
    evaluator.evaluate("position(1)", doc.documentElement, null, XPathResult.ANY_TYPE, null);
});
shouldThrow((){
    evaluator.evaluate("not()", doc.documentElement, null, XPathResult.ANY_TYPE, null);
});
test(doc, doc, "string-length(100)", 3);
shouldThrow((){
    evaluator.evaluate("count(100)", doc.documentElement, null, XPathResult.ANY_TYPE, null);
});
shouldThrow((){
    evaluator.evaluate("adumbrate()", doc.documentElement, null, XPathResult.ANY_TYPE, null);
});

}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>    
        <item id="1" />    
        <item id="2" />    
        <item id="3" />    
        <item id="4" />    
        <item id="5" />    
        <item id="6" />    
        <item id="7" />    
        <item id="8" />    
        <item id="9" />    
    </doc>''',
    'application/xml');

var ROOT = doc.documentElement;
var ITEM1 = ROOT.firstChild;
var ITEM2 = ITEM1.nextNode;
var ITEM3 = ITEM2.nextNode;
var ITEM4 = ITEM3.nextNode;
var ITEM5 = ITEM4.nextNode;
var ITEM6 = ITEM5.nextNode;
var ITEM7 = ITEM6.nextNode;
var ITEM8 = ITEM7.nextNode;
var ITEM9 = ITEM8.nextNode;

test(doc, doc.documentElement, '//item[@id mod 2 = 0] | //item[@id mod 3 = 0]', [ITEM2, ITEM3, ITEM4, ITEM6, ITEM8, ITEM9]);
shouldThrow((){
    evaluator.evaluate("//item | 42", doc.documentElement, null, XPathResult.ANY_TYPE, null);
});
shouldThrow((){
 // This test doesn't throw in py-dom-path, which is a bug.
    evaluator.evaluate("/doc/(item[@id = 2] | item[@id = 6])/@id", doc.documentElement, null, XPathResult.ANY_TYPE, null);
});
shouldThrow((){
    evaluator.evaluate('\"monty\"/anaconda', doc.documentElement, null, XPathResult.ANY_TYPE, null);
});
shouldThrow((){
    evaluator.evaluate('/doc/string(item[@id = 2])/@id', doc.documentElement, null, XPathResult.ANY_TYPE, null);
});
shouldThrow(() {
    evaluator.evaluate('(1)[1]', doc.documentElement, null, XPathResult.ANY_TYPE, null);
});

// Added for WebKit.
test(doc, doc.documentElement, '(1)', 1);
test(doc, doc.documentElement, '((1 + 1))', 2);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>    
        <set id="1">    
            <item>1</item>    
            <item>2</item>    
            <item>3</item>    
            <item>4</item>    
        </set>    
        <set id="2">    
            <item>5</item>    
            <item>6</item>    
            <item>7</item>    
            <item>8</item>    
        </set>    
        <set id="3">    
            <item>0</item>    
            <item>3</item>    
            <item>6</item>    
            <item>9</item>    
        </set>    
        <set id="4">    
            <item>42.0</item>    
        </set>    
    </doc>''',
    'application/xml');

test(doc, doc.documentElement, '1 or 1', true);
test(doc, doc.documentElement, '1 or 0', true);
test(doc, doc.documentElement, '0 or 1', true);
test(doc, doc.documentElement, '0 or 0', false);
test(doc, doc.documentElement, '1 and 1', true);
test(doc, doc.documentElement, '1 and 0', false);
test(doc, doc.documentElement, '0 and 1', false);
test(doc, doc.documentElement, '0 and 0', false);
test(doc, doc.documentElement, '(//set[@id=1]/*) = (//set[@id=3]/*)', true);
test(doc, doc.documentElement, '(//set[@id=1]/*) = (//set[@id=2]/*)', false);
test(doc, doc.documentElement, '(//set[@id=1]/*) != (//set[@id=1]/*)', true);
test(doc, doc.documentElement, '(//set[@id=4]/*) != (//set[@id=4]/*)', false);
test(doc, doc.documentElement, '(//set[@id=1]/*) <= (//set[@id=2]/*)', true);
test(doc, doc.documentElement, '(//set[@id=2]/*) <= (//set[@id=1]/*)', false);
test(doc, doc.documentElement, '(//set[@id=1]/*) < (//set[@id=2]/*)', true);
test(doc, doc.documentElement, '(//set[@id=2]/*) < (//set[@id=1]/*)', false);
test(doc, doc.documentElement, '(//set[@id=2]/*) > (//set[@id=1]/*)', true);
test(doc, doc.documentElement, '(//set[@id=1]/*) > (//set[@id=2]/*)', false);
test(doc, doc.documentElement, '(//set[@id=2]/*) >= (//set[@id=1]/*)', true);
test(doc, doc.documentElement, '(//set[@id=1]/*) >= (//set[@id=2]/*)', false);
test(doc, doc.documentElement, '(//set[@id=4]/*) = (1 = 1)', true);
test(doc, doc.documentElement, '(//set[@id=4]/*) = (1 = 0)', false);
test(doc, doc.documentElement, '(//set[@id=4]/*) != (1 = 0)', true);
test(doc, doc.documentElement, '(//set[@id=4]/*) != (1 = 1)', false);
test(doc, doc.documentElement, '(//set[@id=4]/*) = 42', true);
test(doc, doc.documentElement, '(//set[@id=4]/*) = 43', false);
test(doc, doc.documentElement, '(//set[@id=4]/*) != 43', true);
test(doc, doc.documentElement, '(//set[@id=4]/*) != 42', false);
test(doc, doc.documentElement, '(//set[@id=4]/*) = "42.0"', true);
test(doc, doc.documentElement, '(//set[@id=4]/*) = "42"', false);
test(doc, doc.documentElement, '(//set[@id=4]/*) != "42"', true);
test(doc, doc.documentElement, '(//set[@id=4]/*) != "42.0"', false);
test(doc, doc.documentElement, '"a" <= "a"', false);
test(doc, doc.documentElement, '"a" <= "b"', false);
test(doc, doc.documentElement, '"a" >= "a"', false);
test(doc, doc.documentElement, '"b" > "a"', false);
test(doc, doc.documentElement, '1 <= 1', true);
test(doc, doc.documentElement, '2 <= 1', false);
test(doc, doc.documentElement, '1 < 2', true);
test(doc, doc.documentElement, '1 < 1', false);
test(doc, doc.documentElement, '1 >= 1', true);
test(doc, doc.documentElement, '1 >= 2', false);
test(doc, doc.documentElement, '2 > 1', true);
test(doc, doc.documentElement, '1 > 1', false);
}
    checkTestFailures();    
}