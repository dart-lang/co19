/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Test that the ancestor, descendant, following, preceding, and self axes partition the document
 * test fails: CHAPTER1 is Text
 */
import "dart:collection";
import "dart:html";
import "../xpath-test-pre.dart";

String xmlStr=r'''
    <doc id="0">
        <chapter id="1">
            <section id="1.1">
                <item id="1.1.1" />
            </section>
        </chapter>
        <chapter id="2">
            <section id="2.1">
                <item id="2.1.1" />
            </section>
            <section id="2.2">
                <item id="2.2.1" /><item id="2.2.2" /><item id="2.2.3" />
            </section>
            <section id="2.3">
                <item id="2.3.1" />
            </section>
        </chapter>
        <chapter id="3">
            <section id="3.1">
                <item id="3.1.1" />
            </section>
        </chapter>
    </doc>
    ''';

void checkArraysAreEqual(List array1, List array2, String testName) {
   if (array1.length != array2.length) {
      testFailed(testName, "different length: ${array1.length} != ${array2.length}");
   }
   var temp = new HashMap();
   // Put all the elements from array1 into a "tagged" array
   for (var i = 0; i < array1.length; i++) {
      var key = array1[i];
      // temp[key] = # of occurrences of the value (so an element could appear multiple times)
      if (temp[key]==null) {
        temp[key]=1;
      } else {
        temp[key]=temp[key]+1;
      }
   }
   // Go through array2 - if same tag missing in "tagged" array, not equal
   for (var i = 0; i < array2.length; i++) {
      var key = array2[i];
      if (temp[key]==null) {
         // Key didn't appear in array1, arrays are not equal.
         testFailed(testName, "temp[$key]==null");
      } else if (temp[key] == 1) {
         temp.remove(key);
      } else {
      // Subtract to keep track of # of appearances in array2
        temp[key]=temp[key]-1;
      }  
   }
   // If we get to this point, then every generated key in array1 showed up the exact same
   // number of times in array2, so the arrays are equal.
   if (temp.isEmpty) {
      testPassed(testName);
   } else {
      testFailed(testName, "temp is not empty: temp.length=${temp.length}");
   }
}
     
void main() {
    var doc = (new DomParser()).parseFromString(xmlStr, 'application/xml');
    var ROOT = doc.documentElement;
// print("ROOT is ${ROOT.runtimeType}");
    var CHAPTER1 = ROOT.children[0];
// print("CHAPTER1 is ${CHAPTER1.runtimeType}");
    var SECTION11 = CHAPTER1.children[0];
// print("after SECTION11: SECTION11=$SECTION11");
    var ITEM111 = SECTION11.children[0];
// print("after SECTION11: ITEM111=$ITEM111");
    
    var CHAPTER2 = CHAPTER1. nextElementSibling;
// print("CHAPTER2 is ${CHAPTER2.runtimeType}");
    var SECTION21 = CHAPTER2.children[0];
// print("SECTION21=$SECTION21");
    var ITEM211 = SECTION21.children[0];
    var SECTION22 = SECTION21. nextElementSibling;
// print("SECTION22=$SECTION22");
    var ITEM221 = SECTION22.children[0];
    var ITEM222 = ITEM221. nextElementSibling;
    var ITEM223 = ITEM222. nextElementSibling;
    var SECTION23 = SECTION22. nextElementSibling;
// print("SECTION23=$SECTION23");
    var ITEM231 = SECTION23.children[0];
    
    var CHAPTER3 = CHAPTER2. nextElementSibling;
    var SECTION31 = CHAPTER3.children[0];
// print("after SECTION31: SECTION31=$SECTION31");
    
    var ITEM311 = SECTION31.children[0];
    
    test(doc, doc.documentElement, '//*[@id="2"]/child::*', [SECTION21, SECTION22, SECTION23]);
    test(doc, doc.documentElement, '//*[@id="2.2"]/parent::*', [CHAPTER2]);
    test(doc, doc.documentElement, '//*[@id="2.2"]/ancestor::*', [ROOT, CHAPTER2]);
    test(doc, doc.documentElement, '//*[@id="2.2"]/following-sibling::*', [SECTION23]);
    test(doc, doc.documentElement, '//*[@id="2.2"]/preceding-sibling::*', [SECTION21]);
    test(doc, doc.documentElement, '//*[@id="2.2"]/following::*', [SECTION23, ITEM231, CHAPTER3, SECTION31, ITEM311]);
    test(doc, doc.documentElement, '//*[@id="2.2"]/preceding::*', [CHAPTER1, SECTION11, ITEM111, SECTION21, ITEM211]);
    
    test(doc, doc.documentElement, '//*[@id="2.2"]/attribute::*', [SECTION22.getAttribute("id")]);
    
    test(doc, doc.documentElement, '//*[@id="2.2"]/self::*', [SECTION22]);
    test(doc, doc.documentElement, '//*[@id="1"]/descendant-or-self::*', [CHAPTER1, SECTION11, ITEM111]);
    test(doc, doc.documentElement, '//*[@id="2.2"]/ancestor-or-self::*', [ROOT, CHAPTER2, SECTION22]);
    
    XPathEvaluator evaluator=new XPathEvaluator();
    var nodeCount = evaluator.evaluate("count(//*)", doc.documentElement, null, XPathResult.ANY_TYPE, null).numberValue;
    shouldBe(nodeCount, 16);
    var allNodes = evaluator.evaluate("//*", doc.documentElement, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);
    var allNodesSet = [];
    for (int i = 0; i < allNodes.snapshotLength; ++i) {
        allNodesSet.add(allNodes.snapshotItem(i));
    }
    for (int i = 0; i < allNodes.snapshotLength; ++i) {
        var node = allNodes.snapshotItem(i);
        var resultNodes = [];
        var axes = ['ancestor','descendant','following','preceding','self'];
        for (var axis in axes) {
            var res = evaluator.evaluate("$axis::*", node, null, XPathResult.UNORDERED_NODE_ITERATOR_TYPE, null);
            var n;
            for (n = res.iterateNext(); n!=null; n = res.iterateNext()) {
                resultNodes.add(n);
            }
        }
        checkArraysAreEqual(resultNodes, allNodesSet, node.getAttribute("id"));
    }

    checkTestFailures();    
}
