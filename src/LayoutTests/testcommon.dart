/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

library test_common;

import 'dart:html';
import 'dart:async';
import "../Utils/expect.dart";

var Html5Elements = [ 'a', 'abbr', 'address', 'area', 'article', 'aside',
        'audio', 'b', 'base', 'bdi', 'bdo', 'blockquote', 'body', 'br',
        'button', 'canvas', 'caption', 'cite', 'code', 'col', 'colgroup',
        'command', 'datalist', 'dd', 'del', 'details', 'dfn', 'dialog', 'div',
        'dl', 'dt', 'em', 'embed', 'fieldset', 'figcaption', 'figure',
        'footer', 'form', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'head', 'header',
        'hgroup', 'hr', 'html', 'i', 'iframe', 'img', 'input', 'ins', 'kbd',
        'keygen', 'label', 'legend', 'li', 'link', 'map', 'mark', 'menu',
        'meta', 'meter', 'nav', 'noscript', 'object', 'ol', 'optgroup',
        'option', 'output', 'p', 'param', 'pre', 'progress', 'q', 'rp', 'rt',
        'ruby', 's', 'samp', 'script', 'section', 'select', 'small', 'source',
        'span', 'strong', 'style', 'sub', 'table', 'tbody', 'td', 'textarea',
        'tfoot', 'th', 'thead', 
        
        // 'time',
        
        'title', 'tr', 'track', 'u', 'ul',
        'var', 'video', 'wbr' ];

var HtmlNamespace = 'http://www.w3.org/1999/xhtml';
var SvgNamespace = "http://www.w3.org/2000/svg";
var XlinkNamespace = "http://www.w3.org/1999/xlink";

class NullTreeSanitizer implements NodeTreeSanitizer {
    void sanitizeTree(Node node) {}
}

escapeHTML(text)
{
  //return text.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/\0/g, "\\0");
  
  return text
    .replaceAll(new RegExp('&'), "&amp;")
    .replaceAll(new RegExp('<'), "&lt;")
    .replaceAll(new RegExp(r'\0'), "\\0");
}

var reason;

debug(name) {
  reason = name;
}

shouldBe(actual, expected, [unused_quiet]) => Expect.equals(expected, actual, reason);
shouldNotBe(actual, expected, [unused_quiet]) => Expect.notEquals(expected, actual, reason);
shouldBeTrue(actual) => Expect.isTrue(actual, reason);
shouldBeFalse(actual) => Expect.isFalse(actual, reason);
shouldBeNull(actual) => Expect.isNull(actual, reason);
shouldThrow(func(), [check]) => Expect.throws(func, check, reason);

testFailed(message) => Expect.fail(message);
testPassed(_) {}

var shouldBeEqualToString = shouldBe;

setTimeout(func(), milliseconds) =>
  new Future.delayed(new Duration(milliseconds: milliseconds), func);
