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
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      :-webkit-any(h1),
      :-webkit-any( #div1, b ),
      :-webkit-any(.foo, #bar),
      :-webkit-any(i,p,:link,span:focus) {
          background-color: blue;
      }

      #test-last-child :-webkit-any(:last-child),
      :-webkit-any(:link:focus),
      #container-div :-webkit-any(:link, :not(a)),
      h1:-webkit-any(.h1class, #bar) {
          background-color: green;
      }

      /* Only simple selectors should work. */
      :-webkit-any() {
          background-color: red;
      }

      :-webkit-any(s,:nonexistentpseudo) {
          background-color: red;
      }

      div~q {
          background-color: blue;
      }
      :-webkit-any(div ~ q) {
          background-color: red;
      }
      :-webkit-any(div~q) {
          background-color: red;
      }

      q+q {
          background-color: blue;
      }
      :-webkit-any(q+q) {
          background-color: red;
      }

      q>span {
          background-color: blue;
      }
      :-webkit-any(q>span) {
          background-color: red;
      }

      div span {
          background-color: blue;
      }
      :-webkit-any(div span) {
          background-color: red;
      }
      :-webkit-any( div span ) {
          background-color: red;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      This page tests :-webkit-any. This window needs to be focused for the :focus tests to pass.<br>
      <h1>h1</h1>
      <h1 class="h1class">h1</h1>
      <div id="div1">div</div>
      <div>foo</div>
      <b>b</b>
      <i>i</i>
      <p>p</p>
      <a href="http://webkit.org">a</a>
      <span id="span1">span<span>
      <li class="foo">li</li>
      <u id="bar">u</u>
      <s>s</s>
      <div id="container-div"><input type='text'><a href='http://www.example.com/'></a><div></div><a name='foo'></div>
      <div><span>div span</span></div>
      <q>div~q</q>
      <q>q+q</q>
      <q><span>q>span</span></q>
      <div id="test-last-child"><p>first</p><p>last</p></div>
      <pre id="console"></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  assertColor(selectorOrElement, rbgColor)
  {
    debug("");
    var element;

    if (selectorOrElement is String) {
      debug(selectorOrElement);
      element = document.body.querySelector(selectorOrElement);
    } else {
      debug("Element: " + selectorOrElement.nodeName);
      element = selectorOrElement;
    }

    shouldBe(getComputedStyle(element, null).getPropertyValue('background-color'), rbgColor);
  }

  assertBlue(selectorOrElement)
  {
    assertColor(selectorOrElement, 'rgb(0, 0, 255)');
  }

  assertWhite(selectorOrElement)
  {
    assertColor(selectorOrElement, 'rgba(0, 0, 0, 0)');
  }

  assertGreen(selectorOrElement)
  {
    assertColor(selectorOrElement, 'rgb(0, 128, 0)');
  }

  focus(selector)
  {
    var element = document.body.querySelector(selector);
    element.tabIndex = -1;
    element.focus();
  }

  assertBlue("h1");
  assertBlue("#div1");

  // Ensure the div with ID after the first div does not share a RenderStyle with the first div.
  assertWhite(document.querySelectorAll("div")[1]);

  assertBlue("b");
  assertBlue("i");
  assertBlue("p");

  assertWhite("#span1");
  focus("#span1");
  assertBlue("span:focus");

  assertBlue("a");
  focus("a");
  assertGreen("a:focus");

  assertBlue(".foo");
  assertBlue("#bar");

  assertGreen("h1.h1class");

  debug("");
  shouldBe(document.body.querySelectorAll('#container-div :-webkit-any([href],input[type],input[name])').length, 2);
  shouldBe(document.body.querySelectorAll('#container-div :-webkit-any(div,a):-webkit-any([type],[href],[name])').length, 2);
  shouldBe(document.body.querySelectorAll('#container-div :-webkit-any(:link, :not(a))').length, 3);
  assertGreen("#container-div input");
  assertGreen("#container-div a[href]");
  assertGreen("#container-div div");
  assertWhite("#container-div a[name]");

  assertWhite("s");
  assertBlue("div span");
  assertBlue("div ~ q");
  assertBlue("q+q");
  assertBlue("q>span");

  assertBlue("#test-last-child :first-child");
  assertGreen("#test-last-child :last-child");
}
