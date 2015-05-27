/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Various tests for the aside element.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var testParent = document.createElement('div');
  document.body.append(testParent);
  
  testParent.innerHtml = '<p>Test that <aside id="aside1">an aside element</aside> closes &lt;p>.</p>';
  var aside1 = document.getElementById('aside1');
  Expect.isFalse(aside1.parentNode.nodeName == "P", 'test1');

  testParent.innerHtml = '<aside>Test that <p id="p1">a p element</p> does not close an aside element.</aside>';
  var p1 = document.getElementById('p1');
  Expect.equals("ASIDE", p1.parentNode.nodeName, 'test2');

  testParent.innerHtml = '<aside id="aside2">Test that <aside id="aside3">an aside element</aside> can be nested inside another.</aside>';
  var aside3 = document.getElementById('aside3');
  Expect.equals("aside2", aside3.parentNode.id, 'test3');

  function getWeight(id) {
    var x = document.getElementById(id);
    return x.getComputedStyle().getPropertyValue('font-weight');
  }

  testParent.innerHtml = '<b><aside id="aside4">This text should be bold.</aside> <span id="span1">This is also bold.</span></b>';
  Expect.equals("bold", getWeight("aside4"), 'test4');
  Expect.equals("bold", getWeight("span1"), 'test5');
  testParent.remove();

  var editable = document.createElement('div');
  editable.innerHtml = '[<span id="span2">The text will be a child of &lt;aside>.</span>]';
  document.body.append(editable);
  editable.contentEditable = 'true';
  var selection = window.getSelection();
  selection.selectAllChildren(editable);
  document.execCommand('FormatBlock', false, 'aside');
  //selection.collapse();
  selection.collapseToEnd();
  Expect.equals("ASIDE", document.getElementById("span2").parentNode.nodeName,
      'test6');
  editable.remove();
}

