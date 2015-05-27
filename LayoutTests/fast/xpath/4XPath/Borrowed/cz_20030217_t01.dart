/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after LayoutTests/fast/xpath/4XPath/Borrowed/cz_20030217.html
 * @description 
 */
import "dart:html";
import "../../../../../Utils/expect.dart";
import "../../../../testcommon.dart";

void main() {
    const SRC = r'''
<?xml version=\'1.0\'?>
<alpha>
  <beta no="a">
    <gamma>
      <delta>1</delta>
    </gamma>
    <delta mark="foo">2</delta>
    <gamma mark="bar">
      <delta>3</delta>
    </gamma>
  </beta>
  <beta no="b">
    <delta>4</delta>
    <gamma>
      <delta>5</delta>
    </gamma>
  </beta>
</alpha>
''';

    Document doc = (new DomParser()).parseFromString(SRC, "application/xml");
    XPathEvaluator evaluator=new XPathEvaluator();
    
    String expr = '/alpha/beta[attribute::no = "a"]';
    XPathResult nodeset = evaluator.evaluate(expr, doc, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);
    Expect.equals(nodeset.snapshotLength, 1, expr);

    expr = '/alpha/beta[attribute::no = 1]';
    nodeset = evaluator.evaluate(expr, doc, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);
    Expect.equals(nodeset.snapshotLength, 0, expr);

    expr = '/alpha/beta[@no = "a"]';
    nodeset = evaluator.evaluate(expr, doc, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);
    Expect.equals(nodeset.snapshotLength, 1, expr);

    expr = '/alpha/beta[@no = 1]';
    nodeset = evaluator.evaluate(expr, doc, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);
    Expect.equals(nodeset.snapshotLength, 0, expr);
}
