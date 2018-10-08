/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Various tests for the hgroup element.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var testParent = document.createElement('div');
  document.body.append(testParent);

  //debug('&lt;hgroup> closes &lt;p>:');
  testParent.innerHtml = '<p>Test that <hgroup id="hgroup1"><h1>a hgroup element</h1></hgroup> closes &lt;p>.</p>';
  var hgroup1 = document.getElementById('hgroup1');
  Expect.isFalse(hgroup1.parentNode.nodeName == "P");

  //debug('&lt;p> does not close &lt;hgroup>:');
  testParent.innerHtml = '<hgroup>Test that <p id="p1">a p element</p> does not close a hgroup element.</hgroup>';
  var p1 = document.getElementById('p1');
  Expect.equals("HGROUP", p1.parentNode.nodeName);

  // Note: hgroup *should* have only h1-h6 elements, but *can* have any elements.
  //debug('&lt;hgroup> can be nested inside &lt;hgroup>:');
  testParent.innerHtml = '<hgroup id="hgroup2">Test that <hgroup id="hgroup3">a hgroup element</hgroup> can be nested inside another.</hgroup>';
  var hgroup3 = document.getElementById('hgroup3');
  Expect.equals("hgroup2", (hgroup3.parentNode as Element).id);

  //debug('Residual style:');
  testParent.innerHtml = '<b><hgroup id="hgroup4"><h2>This text should be bold.</h2></hgroup> <span id="span1">This is also bold.</span></b>';
  getWeight(id) {
    return document.getElementById(id).getComputedStyle().getPropertyValue('font-weight');
  }
  Expect.equals("bold", getWeight("hgroup4"));
  Expect.equals("bold", getWeight("span1"));
  testParent.remove();

  //debug('FormatBlock:');
  var editable = document.createElement('div');
  editable.innerHtml = '[<span id="span2">The text will be a child of &lt;hgroup>.</span>]';
  document.body.append(editable);
  editable.contentEditable = 'true';
  var selection = window.getSelection();
  selection.selectAllChildren(editable);
  document.execCommand('FormatBlock', false, 'hgroup');
  selection.collapseToEnd();
  Expect.equals("HGROUP", document.getElementById("span2").parentNode.nodeName);
  editable.remove();
}

