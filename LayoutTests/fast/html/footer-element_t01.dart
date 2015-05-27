/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Various tests for the footer element.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var testParent = document.createElement('div');
  document.body.append(testParent);

  //debug('&lt;footer> closes &lt;p>:');
  testParent.innerHtml = '<p>Test that <footer id="footer1">a footer element</footer> closes &lt;p>.</p>';
  var footer1 = document.getElementById('footer1');
  Expect.isFalse(footer1.parentNode.nodeName == "P");

  //debug('&lt;p> does not close &lt;footer>:');
  testParent.innerHtml = '<footer>Test that <p id="p1">a p element</p> does not close a footer element.</footer>';
  var p1 = document.getElementById('p1');
  Expect.equals("FOOTER", p1.parentNode.nodeName);

  //debug('&lt;footer> can be nested inside &lt;footer> or &lt;header>:');
  testParent.innerHtml = '<footer id="footer2">Test that <footer id="footer3">a footer element</footer> can be nested inside another footer element.</footer>';
  var footer3 = document.getElementById('footer3');
  Expect.equals("footer2", footer3.parentNode.id);
  testParent.innerHtml = '<header id="header1">Test that <footer id="footer5">a footer element</footer> can be nested inside a header element.</header>';
  var footer5 = document.getElementById('footer5');
  Expect.equals("header1", footer5.parentNode.id);

  //debug('Residual style:');
  testParent.innerHtml = '<b><footer id="footer4">This text should be bold.</footer> <span id="span1">This is also bold.</span></b>';
  getWeight(id) {
    return document.getElementById(id).getComputedStyle().getPropertyValue('font-weight');
  }
  Expect.equals("bold", getWeight("footer4"));
  Expect.equals("bold", getWeight("span1"));
  testParent.remove();

  //debug('FormatBlock:');
  var editable = document.createElement('div');
  editable.innerHtml = '[<span id="span2">The text will be a child of &lt;footer>.</span>]';
  document.body.append(editable);
  editable.contentEditable = 'true';
  var selection = window.getSelection();
  selection.selectAllChildren(editable);
  document.execCommand('FormatBlock', false, 'footer');
  selection.collapseToEnd();
  Expect.equals("FOOTER", document.getElementById("span2").parentNode.nodeName);
  editable.remove();
}

