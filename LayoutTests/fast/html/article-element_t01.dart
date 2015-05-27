/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Various tests for the article element.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var testParent = document.createElement('div');
  document.body.append(testParent);
  
  testParent.innerHtml = '<p>Test that <article id="article1">an article element</article> closes &lt;p>.</p>';
  var article1 = document.getElementById('article1');
  Expect.isFalse(article1.parentNode.nodeName == "P", 'test1');

  testParent.innerHtml = '<article>Test that <p id="p1">a p element</p> does not close an article element.</article>';
  var p1 = document.getElementById('p1');
  Expect.equals("ARTICLE", p1.parentNode.nodeName, 'test2');

  testParent.innerHtml = '<article id="article2">Test that <article id="article3">an article element</article> can be nested inside another.</article>';
  var article3 = document.getElementById('article3');
  Expect.equals("article2", article3.parentNode.id, 'test3');

  function getWeight(id) {
    var x = document.getElementById(id);
    return x.getComputedStyle().getPropertyValue('font-weight');
  }

  testParent.innerHtml = '<b><article id="article4">This text should be bold.</article> <span id="span1">This is also bold.</span></b>';
  Expect.equals("bold", getWeight("article4"), 'test4');
  Expect.equals("bold", getWeight("span1"), 'test5');
  testParent.remove();

  var editable = document.createElement('div');
  editable.innerHtml = '[<span id="span2">The text will be a child of &lt;article>.</span>]';
  document.body.append(editable);
  editable.contentEditable = 'true';
  var selection = window.getSelection();
  selection.selectAllChildren(editable);
  document.execCommand('FormatBlock', false, 'article');
  selection.collapseToEnd();
  Expect.equals("ARTICLE", document.getElementById("span2").parentNode.nodeName);
  editable.remove();
}

