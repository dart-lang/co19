/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after LayoutTests/fast/xpath/4XPath/Borrowed/namespace-nodes.html
 * @description Tests that accessing XPath namespace axis doesn't cause a crash, see 
 * <a href="bug http://bugs.webkit.org/show_bug.cgi?id=12724">bug 12724</a>
 * The original test also fails with snapshotLength==0.
 */
import "dart:html";
import "../../../../../Utils/expect.dart";
import "../../../../testcommon.dart";

int passcnt=0;
int failcnt=0;
String failures="";

void checkTestFailures() {
  print("tests passed: $passcnt; failed: $failcnt");
  if (failcnt==0) return;
  Expect.fail(failures);
}

void main() {
    String SRC_1 = r'''
<?xml version="1.0" encoding="utf-8"?>
<docu>
<elem xmlns:unused="urn:uuu000"/>
<elem xmlns="urn:sss111"/>
<y:elem xmlns:y="urn:yyyy222"/>
</docu>
''';

    XPathEvaluator evaluator=new XPathEvaluator();
    Document doc = (new DomParser()).parseFromString(SRC_1, "application/xml");
    
    void test(String expr, int expectedLength) {
        var nodeset = evaluator.evaluate(expr, doc, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);
        int actual=nodeset.snapshotLength;
        if (actual==expectedLength) {
            passcnt++;
        } else {
            failcnt++;
            failures="$failures\ntest($expr) failed: expected length=$expectedLength, actual=$actual.";
        }
  }
    

    test('//namespace::node()', 7);
    test('//*/namespace::node()', 7);
    test('/*/*/namespace::node()', 6);
    test('/*/namespace::node()|/*/*/namespace::node()', 7);
    test('//*', 4);
    
    checkTestFailures();

}