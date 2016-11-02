/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for Range.comparePoint()
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div style="visibility: hidden">
        <div id=a1>a1
        <div id=b1>b1</div> <div id=c1>c1</div>
        </div>
        
        <div id=a2>a2
        <div id=b2>b2</div> <div id=c2>c2</div>
        </div>
        
        <div id=a3>a3
        <div id=b3>b3</div> <div id=c3>c3</div>
        </div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  // comparePoint( refNode, offset ) - This method returns -1, 0 or 1 depending on 
  // if the point described by the refNode node and an offset within the node is 
  // before, same as, or after the range respectively.

  var range = document.createRange();   

  // test 1 - point before range, different node
  var expectedResult = -1;
  range.selectNode(document.getElementById("a2"));
  var result = range.comparePoint(document.getElementById("b1"), 1);
  shouldBe(result, expectedResult);

  // test 2 - point before range, same node
  range.setStart(document.getElementById("b2"), 1);
  result = range.comparePoint(document.getElementById("b2"), 0);
  shouldBe(result, expectedResult);

  // test 3 - point on range start boundary
  expectedResult = 0;
  range.selectNode(document.getElementById("b2"));
  result = range.comparePoint(document.getElementById("b2"), 0);
  shouldBe(result, expectedResult);

  // test 4 - point within range, same node
  result = range.comparePoint(document.getElementById("b2"), 1);
  shouldBe(result, expectedResult);

  // test 5 - point within range, spans nodes
  range.setStart(document.getElementById("b1"), 1);
  range.setEnd(document.getElementById("c2"), 1);
  result = range.comparePoint( document.getElementById("c2"), 0);
  shouldBe(result, expectedResult);

  // test 6 - point on range end boundary
  result = range.comparePoint(document.getElementById("c2"), 1);
  shouldBe(result, expectedResult);

  // test 7 - point after range, same node
  range.setEnd(document.getElementById("c2"), 0);
  expectedResult = 1;
  result = range.comparePoint(document.getElementById("c2"), 1);
  shouldBe(result, expectedResult);

  // test 8 - point after range, different node
  expectedResult = 1;
  result = range.comparePoint(document.getElementById("a3"), 1);
  shouldBe(result, expectedResult);

  // test 9 - detached range, attached node
  // Detach is a noop (DOM4) but still exist for compat
  // see http://dom.spec.whatwg.org/#dom-range-detach
  expectedResult = 1;
  var detachedRange = document.createRange();
  detachedRange.detach();
  result = detachedRange.comparePoint(document.getElementById("a1"), 0);
  shouldBe(result, expectedResult);

  // test 10 - attached range, detached node
  // firefox/webkit throws an exception
  range.selectNode(document.getElementById("a1"));
  var node = document.getElementById("b1");
  node.remove();
  shouldThrow(() {
    range.comparePoint(node, 0);
  });
}
