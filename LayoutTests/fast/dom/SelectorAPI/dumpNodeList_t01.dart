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
  document.body.setInnerHtml('''
    <div class="one">
        Line 1
        <div class="two">Line 2</div>
        <p>Line <i>3</i></p>
    </div>
    <div id="test" class="one two">
        <div id="me"></div>
        <div id="dupe"></div>
        <div id="dupe"></div>
        <div id="test2" class="one two">line 4</div>
        <p class="two">line 5</p>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

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

  var elm = document.getElementById("test");

  var tagString = elm.outerHtml;
  var range = document.createRange();
  range.selectNode(elm);
  var frag = range.createContextualFragment(tagString);

  debug("Document.querySelectorAll");

  testList(testQuerySelectorAll(document, "#test"), [DivElement]);
  testList(testQuerySelectorAll(document, "#notthere"), []);
  testList(testQuerySelectorAll(document, "#dupe"), [DivElement, DivElement]);
  testList(testQuerySelectorAll(document, ".two"),
      [DivElement, DivElement, DivElement, ParagraphElement]);
  testList(testQuerySelectorAll(document, ".one, .two"),
      [DivElement, DivElement, DivElement, DivElement, ParagraphElement]);
  testThrows(() => testQuerySelectorAll(document, "@font-face"),
    DomException.SYNTAX);
  testThrows(() => testQuerySelectorAll(document, ""),
    DomException.SYNTAX);
  testList(testQuerySelectorAll(document, "#test>div"),
      [DivElement, DivElement, DivElement, DivElement]);

  debug("Element.querySelectorAll");

  testList(testQuerySelectorAll(elm, "#test"), []);
  testList(testQuerySelectorAll(elm, "#test2"), [DivElement]);
  testList(testQuerySelectorAll(elm, "#notthere"), []);
  testList(testQuerySelectorAll(elm, "#dupe"), [DivElement, DivElement]);
  testList(testQuerySelectorAll(elm, ".two"), [DivElement, ParagraphElement]);
  testList(testQuerySelectorAll(elm, ".one, .two"), [DivElement, ParagraphElement]);
  testThrows(() => testQuerySelectorAll(elm, "@font-face"),
      DomException.SYNTAX);
  testThrows(() => testQuerySelectorAll(elm, ""), DomException.SYNTAX);

  debug("DocumentFragment.querySelectorAll");

  testList(testQuerySelectorAll(frag, "#test"), [DivElement]);
  testList(testQuerySelectorAll(frag, "#test2"), [DivElement]);
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

  test(testQuerySelector(document, "#test"), DivElement);
  test(testQuerySelector(document, "#notthere"), Null);
  test(testQuerySelector(document, "#dupe"), DivElement);
  test(testQuerySelector(document, ".two"), DivElement);
  test(testQuerySelector(document, ".one, .two"), DivElement);
  testThrows(() => testQuerySelector(document, "@font-face"),
      DomException.SYNTAX);
  testThrows(() => testQuerySelector(document, ""),
      DomException.SYNTAX);

  debug("Element.querySelector");

  test(testQuerySelector(elm, "#test"), Null);
  test(testQuerySelector(elm, "#test2"), DivElement);
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
  test(testQuerySelector(frag, "#test2"), DivElement);
  test(testQuerySelector(frag, "#notthere"), Null);
  test(testQuerySelector(frag, "#dupe"), DivElement);
  test(testQuerySelector(frag, ".two"), DivElement);
  test(testQuerySelector(frag, ".one, .two"), DivElement);
  testThrows(() => testQuerySelector(frag, "@font-face"),
      DomException.SYNTAX);
  testThrows(() => testQuerySelector(frag, ""),
      DomException.SYNTAX);
}
