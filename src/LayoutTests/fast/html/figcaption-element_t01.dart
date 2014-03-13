/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Various tests for the figcaption element.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  getStyleValue(id, propertyName) {
    return document.getElementById(id).getComputedStyle()
      .getPropertyValue(propertyName);
  }

  var testParent = document.createElement('div');
  document.body.append(testParent);

  //debug('&lt;figcaption> default styling:');
  testParent.innerHtml = '<figcaption id="figcaption0">element</figure>';
  
  var emSize = getStyleValue("figcaption0","font-size");
  Expect.equals("block", getStyleValue("figcaption0","display"));
  
  //debug('&lt;figcaption> closes &lt;p>:');
  testParent.innerHtml = '<p>Test that <figcaption id="figcaption1">a figcaption element</figcaption> closes &lt;p>.</p>';
  var figcaption1 = document.getElementById('figcaption1');
  Expect.isFalse(figcaption1.parentNode.nodeName == "P");
  
  //debug('&lt;p> does not close &lt;figcaption>:');
  testParent.innerHtml = '<figcaption>Test that <p id="p1">a p element</p> does not close a figcaption element.</figcaption>';
  var p1 = document.getElementById('p1');
  Expect.equals("FIGCAPTION", p1.parentNode.nodeName);

  //debug('&lt;figcaption> can be nested inside &lt;figcaption> or &lt;footer>:');
  testParent.innerHtml = '<figcaption id="figcaption2">Test that <figcaption id="figcaption3">a figcaption element</figcaption> can be nested inside another figcaption element.</figcaption>';
  var figcaption3 = document.getElementById('figcaption3');
  Expect.equals("figcaption2", figcaption3.parentNode.id);

  testParent.innerHtml = '<footer id="footer1">Test that <figcaption id="figcaption5">a figcaption element</figcaption> can be nested inside a footer element.</footer>';
  var figcaption5 = document.getElementById('figcaption5');
  Expect.equals("footer1", figcaption5.parentNode.id);

  //debug('Residual style:');
  testParent.innerHtml = '<b><figcaption id="figcaption4">This text should be bold.</figcaption> <span id="span1">This is also bold.</span></b>';
  Expect.equals("bold", getStyleValue("figcaption4","font-weight"));
  Expect.equals("bold", getStyleValue("span1","font-weight"));

  testParent.remove();
}
