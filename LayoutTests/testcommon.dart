/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

library test_common;

import 'dart:math' as Math;
import 'dart:html';
import 'dart:async';
import "../Utils/expect.dart";
export "../Utils/expect.dart";

const String testSuiteRoot = "/root_dart/tests/co19/src/LayoutTests";
const NaN = double.nan;
const Infinity = double.infinity;

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

var escapeHtml = escapeHTML;

var reason;

debug(msg) {
  msg = msg.toString();
  var x = document.getElementById('console');
  if (x != null) {
    var span = document.createElement("span");
    span.innerHtml = msg + '<br />';
    x.append(span);
  }
  reason = msg;
}

consoleList() {
  var console = document.getElementById('console');
  var res = [];
  for (var x in console.childNodes) {
    if (x is SpanElement) {
      res.add(x.firstChild.text);
    }
  }
  return res;
}


shouldBe(actual, expected, [unused_quiet]) => Expect.equals(expected, actual, reason);
shouldBeIdentical(actual, expected, [unused_quiet]) => Expect.identical(expected, actual, reason);
shouldNotBe(actual, expected, [unused_quiet]) => Expect.notEquals(expected, actual, reason);
shouldBeTrue(actual) => Expect.isTrue(actual, reason);
shouldBeFalse(actual) => Expect.isFalse(actual, reason);
shouldBeNull(actual) => Expect.isNull(actual, reason);
shouldBeNonNull(actual) => Expect.isNotNull(actual, reason);
shouldThrow(func(), [bool check(e)]) => Expect.throws(func, check, reason);
shouldNotThrow(func()) {
  try {
    func();
  } catch (e) {
    throw "$reason: $e";
  }
}
shouldBeList(actual, expected) => Expect.listEquals(expected, actual, reason);
shouldBeApprox(actual, expected, tolerance) => Expect.approxEquals(expected, actual, tolerance, reason);
var shouldBeCloseTo = shouldBeApprox;
shouldBeDefined(_) {}

testFailed(message) => Expect.fail(message);
testPassed(msg) {
  msg = msg.toString();
  var x = document.getElementById('console');
  if (x != null) {
    var span = document.createElement("span");
    span.innerHtml = msg + '<br />';
    x.append(span);
  }
}

var shouldBeEqualToString = shouldBe;
var shouldEvaluateTo = shouldBe;

/**
 * Compares actual and expected string, but before comparison removes all
 * quotes and whitespaces
 */
shouldBeLikeString(actual, expected, {message, bool ignoreCase: false}) {
  return Expect.equals(normaliseCSSString(expected, ignoreCase),
      normaliseCSSString(actual, ignoreCase), message);
}

String normaliseCSSString(String str, bool ignoreCase) {
  if (str == null) {
    return null;
  }
  if (ignoreCase) {
    str = str.toLowerCase();
  }
  return str
    .replaceAll(" ", "")
    .replaceAll("'", "")
    .replaceAll("\"", "")
    .replaceAll("\n", "")
    .replaceAll("\r", "")
    .replaceAll("\t", "");
}

shouldBeGreaterThanOrEqual(x,y) {
  var msg = '$x >= $y';
  Expect.isTrue(x >= y, reason != null ? reason + ': $msg' : msg);
}

shouldBeNonZero(actual) {
  var msg = '$actual != 0';
  Expect.isTrue(actual != 0, reason != null ? reason + ': $msg' : msg);
}

shouldBeNaN(actual) => shouldBe(actual, NaN);

setTimeout(func(), [milliseconds=0]) =>
  new Future.delayed(new Duration(milliseconds: milliseconds), func);

startJSTest() {
  var x = document.createElement('div');
  x.id = 'asyncJS';
  x.innerHtml = 'FAIL';
  document.body.append(x);
}

getOrCreate(id, tagName) {
  var element = document.getElementById(id);
  if (element != null)
    return element;

  element = document.createElement(tagName);
  element.id = id;
  var refNode;
  var parent = document.body != null ?  document.body : document.documentElement;
  if (id == "description")
    refNode = getOrCreate("console", "div");
  else
    refNode = parent.firstChild;

  parent.insertBefore(element, refNode);
  return element;
}

description(msg, [unused_quiet])
{
  var span = document.createElement("span");
  span.innerHtml = '<p>$msg</p>';

  var description = getOrCreate("description", "p");
  if (description.firstChild != null)
    description.firstChild.replaceWith(span);
  else
    description.append(span);
}

gc() {
  gcRec(n, i) {
    if (n < 1)
      return {};
    gcRec(n-1, i);
  }
  for (var i = 0; i < 1000; i++)
    gcRec(10, i);
}

firstElementChild(node) => node.childNodes.firstWhere((x) => x is Element);
lastElementChild(node) => node.childNodes.lastWhere((x) => x is Element);

glContext(canvas) {
  var gl = canvas.getContext('webgl');
  if (gl != null)
    return gl;
  return canvas.getContext('experimental-webgl');
}

max(list) => list.reduce(Math.max);
min(list) => list.reduce(Math.min);
abs(x) => x.abs();
floor(x) => x.floor();
ceil(x) => x.ceil();
round(x) => x.round();

CssStyleDeclaration getComputedStyle(Element x, [String pseudoElement]) => x.getComputedStyle(pseudoElement);

getContext2d(id) {
  CanvasElement canvas = document.getElementById(id);
  return canvas.getContext("2d");
}

createContext2d(id) {
  CanvasElement canvas = document.createElement(id);
  return canvas.getContext('2d');
}

addConsole() => document.body.appendHtml('<div id="console"></div>',
    treeSanitizer: NodeTreeSanitizer.trusted);

qwe([x]) => testFailed(x.toString());

String stripQuotes(String text) {
  if (text == null) {
    return null;
  }
  return text.replaceAll("\"", "").replaceAll("'", "");
}

num getNumValue(String strValue, {String strip}) {
  String str = strValue;
  if (strip != null) {
    str = strValue.replaceAll(strip, "");
  }
  return num.parse(str);
}

String get userAgent => window.navigator.userAgent;

/**
 * Determines if the current device is running Opera.
 */
bool get isOpera => userAgent.contains("Opera", 0);

/**
 * Determines if the current device is running Internet Explorer.
 */
bool get isIE => !isOpera && userAgent.contains("Trident/", 0);

/**
 * Determines if the current device is running Firefox.
 */
bool get isFirefox => userAgent.contains("Firefox", 0);

/**
 * Determines if the current device is running WebKit.
 */
bool get isWebKit => !isOpera && userAgent.contains("WebKit", 0);
