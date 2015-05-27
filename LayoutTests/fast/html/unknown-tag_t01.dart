/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test verifies the following:
 * The HTMLUnknownElement interface is used for HTML elements that are not 
 *   defined by the HTML5 specification (or other applicable specifications).
 * The HTMLUnknownElement interface is not used for HTML elements that are 
 *   defined by the HTML5 specification (or other applicable specifications).
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;

  body.setInnerHtml('''
    Test HTMLUnknownElement
    <p>
    This test verifies the following:
    <ol>
    <li>The <code><a href="http://www.whatwg.org/specs/web-apps/current-work/multipage/elements.html#htmlunknownelement">HTMLUnknownElement</a></code>
        interface is used for HTML elements that are not defined by the HTML5
        specification (or other applicable specifications).
    <li>The <code><a href="http://www.whatwg.org/specs/web-apps/current-work/multipage/elements.html#htmlunknownelement">HTMLUnknownElement</a></code>
        interface is <b>not</b> used for HTML elements that <b>are</b> defined
        by the HTML5 specification (or other applicable specifications).
    </ol>
    </p>
    </p>
    <div id="console"></div>

    <b></b>
    <foo1></foo1>
    <foo2></foo2>

    <font></font>
    <h1></h1>
    <table></table>
    ''', treeSanitizer: new NullTreeSanitizer());

  // These tags are required by the HTML spec
  var validTags = ["div", "font", "h1", "table"];

  // These tags are manufactured and should not be recognized by any browser
  var bogusTags = ["foo1", "foo2"];

  var allTags = new List.from(validTags)..addAll(bogusTags);

  isBogusTag (tag) => bogusTags.contains(tag);

  var DynamicElements = {};

  for (var tag in allTags) {
    DynamicElements[tag] = document.createElement(tag);
  }

  for (var tag in DynamicElements.keys) {
    var element = DynamicElements[tag];
    Expect.isTrue(element is HtmlElement, '${element.tagName} is HtmlElement');
    if (isBogusTag(tag)) {
      Expect.isTrue(element is UnknownElement, '${element.tagName} is UnknownElement');
    } else {
      Expect.isFalse(element is UnknownElement, '${element.tagName} is not UnknownElement');
    }
  }

  var staticElements = {};

  for (var tag in allTags) {
    staticElements[tag] = document.getElementsByTagName(tag)[0];
  }

  for (var tag in staticElements.keys) {
    var element = staticElements[tag];
    if (isBogusTag(tag)) {
      Expect.isTrue(element is UnknownElement, '${element.tagName} is UnknownElement');
    } else {
      Expect.isFalse(element is UnknownElement, '${element.tagName} is not UnknownElement');
    }
  }
}
