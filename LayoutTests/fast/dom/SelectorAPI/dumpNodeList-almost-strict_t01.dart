/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var doc = new DomParser().parseFromString('''
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<div class="one">
    Line 1
    <div class="two">Line 2</div>
    <p>Line <i>3</i></p>
</div>
<div id="test" class="one two">
    <div id="me"></div>
    <div id="dupe"></div>
    <div id="dupe"></div>
    <div id="Test2" class="one two">line 4</div>
    <p class="two">line 5</p>
</div>''', 'text/html');

  testQuerySelectorAll(node, selectorString) 
    => node.querySelectorAll(selectorString).map((x) => x.runtimeType).toList();

  testQuerySelector(node, selectorString) 
    => node.querySelector(selectorString).runtimeType;

  testList(actual, expected) => shouldBeList(actual, expected);
  
  test(actual, expected) => shouldBe(actual, expected);

  testThrows(func(), [expected]) {
    if (expected != null)
      shouldThrow(func, (e) => e is DomException && e.name == expected);
    else
      shouldThrow(func);
  }

  var elm = doc.getElementById("test");

  var tagString = elm.outerHtml;
  var range = doc.createRange();
  range.selectNode(elm);
  var frag = range.createContextualFragment(tagString);

  debug("Document.querySelectorAll");

  // Workarounds for https://github.com/dart-lang/sdk/issues/24173
  shouldBe(doc.querySelector("#test") is DivElement, true);
  shouldBe(doc.querySelector("#test") is ParagraphElement, false);
  
  testList(testQuerySelectorAll(doc, "#test"), [DivElement]);
  testList(testQuerySelectorAll(doc, "#notthere"), []);
  testList(testQuerySelectorAll(doc, "#dupe"), [DivElement, DivElement]);
  testList(testQuerySelectorAll(doc, ".two"),
      [DivElement, DivElement, DivElement, ParagraphElement]);
  testList(testQuerySelectorAll(doc, ".one, .two"),
      [DivElement, DivElement, DivElement, DivElement, ParagraphElement]);
  testThrows(() => testQuerySelectorAll(doc, "@font-face"),
      DomException.SYNTAX);
  testThrows(() => testQuerySelectorAll(doc, ""),
      DomException.SYNTAX);
  testList(testQuerySelectorAll(doc, "#test>div"),
      [DivElement, DivElement, DivElement, DivElement]);

  debug("Element.querySelectorAll");

  testList(testQuerySelectorAll(elm, "#test"), []);
  testList(testQuerySelectorAll(elm, "#Test2"), [DivElement]);
  testList(testQuerySelectorAll(elm, "#notthere"), []);
  testList(testQuerySelectorAll(elm, "#dupe"), [DivElement, DivElement]);
  testList(testQuerySelectorAll(elm, ".two"), [DivElement, ParagraphElement]);
  testList(testQuerySelectorAll(elm, ".one, .two"), [DivElement, ParagraphElement]);
  testThrows(() => testQuerySelectorAll(elm, "@font-face"),
      DomException.SYNTAX);
  testThrows(() => testQuerySelectorAll(elm, ""), DomException.SYNTAX);

  debug("DocumentFragment.querySelectorAll");

  testList(testQuerySelectorAll(frag, "#test"), [DivElement]);
  testList(testQuerySelectorAll(frag, "#Test2"), [DivElement]);
  testList(testQuerySelectorAll(frag, "#notthere"), []);
  testList(testQuerySelectorAll(frag, "#dupe"), [DivElement, DivElement]);
  testList(testQuerySelectorAll(frag, ".two"),
      [DivElement, DivElement, ParagraphElement]);
  testList(testQuerySelectorAll(frag, ".one, .two"),
      [DivElement, DivElement, ParagraphElement]);
  testThrows(() => testQuerySelectorAll(frag, "@font-face"),
      DomException.SYNTAX);
  testThrows(() => testQuerySelectorAll(frag, ""),
      DomException.SYNTAX);

  debug("Document.querySelector");

  test(testQuerySelector(doc, "#test"), DivElement);
  test(testQuerySelector(doc, "#notthere"), Null);
  test(testQuerySelector(doc, "#dupe"), DivElement);
  test(testQuerySelector(doc, ".two"), DivElement);
  test(testQuerySelector(doc, ".one, .two"), DivElement);
  testThrows(() => testQuerySelector(doc, "@font-face"),
      DomException.SYNTAX);
  testThrows(() => testQuerySelector(doc, ""),
      DomException.SYNTAX);

  debug("Element.querySelector");

  test(testQuerySelector(elm, "#test"), Null);
  test(testQuerySelector(elm, "#Test2"), DivElement);
  test(testQuerySelector(elm, "#notthere"), Null);
  test(testQuerySelector(elm, "#dupe"), DivElement);
  test(testQuerySelector(elm, ".two"), DivElement);
  test(testQuerySelector(elm, ".one, .two"), DivElement);
  testThrows(() => testQuerySelector(elm, "@font-face"),
      DomException.SYNTAX);
  testThrows(() => testQuerySelector(elm, ""),
      DomException.SYNTAX);

  debug("DocumentFragment.querySelector");

  test(testQuerySelector(frag, "#test"), DivElement);
  test(testQuerySelector(frag, "#Test2"), DivElement);
  test(testQuerySelector(frag, "#notthere"), Null);
  test(testQuerySelector(frag, "#dupe"), DivElement);
  test(testQuerySelector(frag, ".two"), DivElement);
  test(testQuerySelector(frag, ".one, .two"), DivElement);
  testThrows(() => testQuerySelector(frag, "@font-face"),
      DomException.SYNTAX);
  testThrows(() => testQuerySelector(frag, ""),
      DomException.SYNTAX);
}
