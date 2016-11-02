/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Various tests for the main element.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var testParent = document.createElement('div');
  document.body.append(testParent);

  //debug('&lt;main> closes &lt;p>:');
  testParent.setInnerHtml('<p>Test that <main id="main1">an main element</main> closes &lt;p>.</p>',
      treeSanitizer: new NullTreeSanitizer());
  var main1 = document.getElementById('main1');
  Expect.isFalse(main1.parentNode.nodeName == "P");

  //debug('&lt;p> does not close &lt;main>:');
  testParent.setInnerHtml('<main>Test that <p id="p1">a p element</p> does not close an main element.</main>',
      treeSanitizer: new NullTreeSanitizer());
  var p1 = document.getElementById('p1');
  Expect.equals("MAIN", p1.parentNode.nodeName);

  //debug('&lt;main> can be nested inside &lt;main>:');
  testParent.setInnerHtml('<main id="main2">Test that <main id="main3">an main element</main> can be nested inside another.</main>',
      treeSanitizer: new NullTreeSanitizer());
  var main3 = document.getElementById('main3');
  Expect.equals("main2", (main3.parentNode as Element).id);

  //debug('Residual style:');
  testParent.setInnerHtml('<b><main id="main4">This text should be bold.</main> <span id="span1">This is also bold.</span></b>',
      treeSanitizer: new NullTreeSanitizer());
  getWeight(id) {
    return document.getElementById(id).getComputedStyle().getPropertyValue('font-weight');
  }
  Expect.equals("bold", getWeight("main4"));
  Expect.equals("bold", getWeight("span1"));
  testParent.remove();

  //debug('FormatBlock:');
  var editable = document.createElement('div');
  editable.setInnerHtml('[<span id="span2">The text will be a child of &lt;main>.</span>]',
      treeSanitizer: new NullTreeSanitizer());
  document.body.append(editable);
  editable.contentEditable = 'true';
  var selection = window.getSelection();
  selection.selectAllChildren(editable);
  document.execCommand('FormatBlock', false, 'main');
  selection.collapseToEnd();
  Expect.equals("MAIN", document.getElementById("span2").parentNode.nodeName);
  editable.remove();
}

