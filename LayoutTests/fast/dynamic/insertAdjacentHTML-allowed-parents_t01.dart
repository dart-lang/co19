/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <pre id="console"></pre>
      <div id="testZone"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  log(msg)
  {
    document.getElementById('console').append(new Text(msg + "\n"));
  }

  var testZone;
  test(tag)
  {
    var el = document.createElement(tag);
    testZone.append(el);

    try {
      el.insertAdjacentHtml("beforeBegin", "HTML");
      log("PASS: insertAdjacentHtml did not throw an exception when using the " + tag + " tag.");
    } catch(e) {
      log("FAIL: insertAdjacentHtml threw an exception when using the " + tag + " tag: " + e.toString());
      testFailed(tag);
    }

    testZone.innerHtml = "";
  }

  testZone = document.getElementById('testZone');

  var tags = ["a",
      "abbr",
      "acronym",
      "address",
      "applet",
      "area",
      "audio",
      "b",
      "base",
      "basefont",
      "bdo",
      "big",
      "blockquote",
      "body",
      "br",
      "button",
      "canvas",
      "caption",
      "center",
      "cite",
      "code",
      "col",
      "colgroup",
      "dd",
      "del",
      "dfn",
      "dir",
      "div",
      "dl",
      "dt",
      "em",
      "embed",
      "fieldset",
      "font",
      "form",
      "frame",
      "frameset",
      "h1",
      "h2",
      "h3",
      "h4",
      "h5",
      "h6",
      "head",
      "hr",
      "html",
      "i",
      "iframe",
      "image",
      "img",
      "input",
      "ins",
      "isindex",
      "kbd",
      "keygen",
      "label",
      "layer",
      "legend",
      "li",
      "link",
      "listing",
      "map",
      "marquee",
      "menu",
      "meta",
      "nobr",
      "noembed",
      "noframes",
      "nolayer",
      "noscript",
      "object",
      "ol",
      "optgroup",
      "option",
      "p",
      "param",
      "plaintext",
      "pre",
      "q",
      "s",
      "samp",
      "script",
      "select",
      "small",
      "source",
      "span",
      "strike",
      "strong",
      "style",
      "sub",
      "sup",
      "table",
      "tbody",
      "td",
      "textarea",
      "tfoot",
      "th",
      "thead",
      "title",
      "tr",
      "tt",
      "u",
      "ul",
      "var",
      "video",
      "wbr",
      "xmp"];

  for (var i = 0; i < tags.length; ++i) {
    test(tags[i]);
  }

  test("unknown");
}
