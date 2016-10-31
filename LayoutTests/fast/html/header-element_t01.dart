/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Various tests for the header element.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var testParent = document.createElement('div');
  document.body.append(testParent);

  //debug('&lt;header> closes &lt;p>:');
  testParent.innerHtml = '<p>Test that <header id="header1">a header element</header> closes &lt;p>.</p>';
  var header1 = document.getElementById('header1');
  Expect.isFalse(header1.parentNode.nodeName == "P");

  //debug('&lt;p> does not close &lt;header>:');
  testParent.innerHtml = '<header>Test that <p id="p1">a p element</p> does not close a header element.</header>';
  var p1 = document.getElementById('p1');
  Expect.equals("HEADER", p1.parentNode.nodeName);

  //debug('&lt;header> can be nested inside &lt;header> or &lt;footer>:');
  testParent.innerHtml = '<header id="header2">Test that <header id="header3">a header element</header> can be nested inside another header element.</header>';
  var header3 = document.getElementById('header3');
  Expect.equals("header2", (header3.parentNode as Element).id);
  testParent.innerHtml = '<footer id="footer1">Test that <header id="header5">a header element</header> can be nested inside a footer element.</footer>';
  var header5 = document.getElementById('header5');
  Expect.equals("footer1", (header5.parentNode as Element).id);

  //debug('Residual style:');
  testParent.innerHtml = '<b><header id="header4">This text should be bold.</header> <span id="span1">This is also bold.</span></b>';
  getWeight(id) {
    return document.getElementById(id).getComputedStyle().getPropertyValue('font-weight');
  }
  Expect.equals("bold", getWeight("header4"));
  Expect.equals("bold", getWeight("span1"));
  testParent.remove();

  //debug('FormatBlock:');
  var editable = document.createElement('div');
  editable.innerHtml = '[<span id="span2">The text will be a child of &lt;header>.</span>]';
  document.body.append(editable);
  editable.contentEditable = 'true';
  var selection = window.getSelection();
  selection.selectAllChildren(editable);
  document.execCommand('FormatBlock', false, 'header');
  selection.collapseToEnd();
  Expect.equals("HEADER", document.getElementById("span2").parentNode.nodeName);
  editable.remove();
}
