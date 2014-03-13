/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Various tests for the figure element.
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

  //debug('&lt;figure> default styling:');
  testParent.innerHtml = '<figure id="figure0">element</figure>';
  var emSize = getStyleValue("figure0","font-size");
  Expect.equals("block", getStyleValue("figure0","display"));
  Expect.equals(emSize, getStyleValue("figure0","margin-top"));
  Expect.equals("40px", getStyleValue("figure0","margin-right"));
  Expect.equals(emSize, getStyleValue("figure0","margin-bottom"));
  Expect.equals("40px", getStyleValue("figure0","margin-left"));

  //debug('&lt;figure> closes &lt;p>:');
  testParent.innerHtml = '<p>Test that <figure id="figure1">a figure element</figure> closes &lt;p>.</p>';
  var figure1 = document.getElementById('figure1');
  Expect.isFalse(figure1.parentNode.nodeName == "P");

  //debug('&lt;p> does not close &lt;figure>:');
  testParent.innerHtml = '<figure>Test that <p id="p1">a p element</p> does not close a figure element.</figure>';
  var p1 = document.getElementById('p1');
  Expect.equals("FIGURE", p1.parentNode.nodeName);

  //debug('&lt;figure> can be nested inside &lt;figure> or &lt;footer>:');
  testParent.innerHtml = '<figure id="figure2">Test that <figure id="figure3">a figure element</figure> can be nested inside another figure element.</figure>';
  var figure3 = document.getElementById('figure3');
  Expect.equals("figure2", figure3.parentNode.id);
  testParent.innerHtml = '<footer id="footer1">Test that <figure id="figure5">a figure element</figure> can be nested inside a footer element.</footer>';
  var figure5 = document.getElementById('figure5');
  Expect.equals("footer1", figure5.parentNode.id);

  //debug('Residual style:');
  testParent.innerHtml = '<b><figure id="figure4">This text should be bold.</figure> <span id="span1">This is also bold.</span></b>';
  Expect.equals("bold", getStyleValue("figure4","font-weight"));
  Expect.equals("bold", getStyleValue("span1","font-weight"));

  testParent.remove();
}

