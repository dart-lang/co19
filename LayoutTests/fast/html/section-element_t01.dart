/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Various tests for the section element.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var testParent = document.createElement('div');
  document.body.append(testParent);

  //debug('&lt;section> closes &lt;p>:');
  testParent.innerHtml = '<p>Test that <section id="section1">a section element</section> closes &lt;p>.</p>';
  var section1 = document.getElementById('section1');
  Expect.isFalse(section1.parentNode.nodeName == "P");

  //debug('&lt;p> does not close &lt;section>:');
  testParent.innerHtml = '<section>Test that <p id="p1">a p element</p> does not close a section element.</section>';
  var p1 = document.getElementById('p1');
  Expect.equals("SECTION", p1.parentNode.nodeName);

  //debug('&lt;section> can be nested inside &lt;section>:');
  testParent.innerHtml = '<section id="section2">Test that <section id="section3">a section element</section> can be nested inside another.</section>';
  var section3 = document.getElementById('section3');
  Expect.equals("section2", section3.parentNode.id);

  //debug('Residual style:');
  testParent.innerHtml = '<b><section id="section4">This text should be bold.</section> <span id="span1">This is also bold.</span></b>';
  getWeight(id) {
    return document.getElementById(id).getComputedStyle().getPropertyValue('font-weight');
  }
  Expect.equals("bold", getWeight("section4"));
  Expect.equals("bold", getWeight("span1"));
  testParent.remove();

  //debug('FormatBlock:');
  var editable = document.createElement('div');
  editable.innerHtml = '[<span id="span2">The text will be a child of &lt;section>.</span>]';
  document.body.append(editable);
  editable.contentEditable = 'true';
  var selection = window.getSelection();
  selection.selectAllChildren(editable);
  document.execCommand('FormatBlock', false, 'section');
  selection.collapseToEnd();
  Expect.equals("SECTION", document.getElementById("span2").parentNode.nodeName);
  editable.remove();
}
