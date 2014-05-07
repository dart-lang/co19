/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Using document.register() for extending Html and 
 * non-Html elements.
 * @needsreview can custom svg element be created
 */
import "dart:html";
import "dart:svg";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

class CustomHtmlElement extends HtmlElement {
  static const tag = 'html-foo';
  factory CustomHtmlElement() => new Element.tag(tag);
  CustomHtmlElement.created() : super.created();
}

class CustomSvgElement extends GElement {
  static const tag = 'svg-foo';
  factory CustomSvgElement() => new SvgElement.tag(tag);
  CustomSvgElement.created() : super.created();
}

main() {
  createElementFromHtml(html) {
    var container = document.createElement('div');
    container.setInnerHtml(html, treeSanitizer: new NullTreeSanitizer());
      return container.firstChild;
  }

  createElementFromSvg(svg) {
    var container = document.createElement('div');
    container.setInnerHtml('<svg xmlns="http://www.w3.org/2000/svg">'
        + svg + '</svg>', treeSanitizer: new NullTreeSanitizer());
    return container.firstChild.firstChild;
  }

  document.register('html-foo', CustomHtmlElement);

  var html1 = new CustomHtmlElement();
  shouldBe(html1.namespaceUri, "http://www.w3.org/1999/xhtml");
  var html2 = document.createElement('html-foo');
  shouldBe(html2.namespaceUri, "http://www.w3.org/1999/xhtml");
  var html3 = document.createElementNS('http://www.w3.org/1999/xhtml', 'html-foo');
  shouldBe(html3.namespaceUri, "http://www.w3.org/1999/xhtml");
  var html4 = createElementFromHtml('<html-foo></html-foo>');
  shouldBe(html4.namespaceUri, "http://www.w3.org/1999/xhtml");

  var notHtml = document.createElementNS('http://www.example.com/', 'html-foo');
  shouldBe(notHtml.namespaceUri, "http://www.example.com/");
  shouldBeFalse(notHtml is CustomHtmlElement);
  shouldBeFalse(notHtml is HtmlElement);

  //document.register('svg-foo', CustomSvgElement, extendsTag: 'g');
  //var svg1 = new CustomSvgElement();
  //shouldBe(svg1.tagName, "g");
  //shouldBeTrue(svg1 is GElement);
  //shouldBeTrue(svg1 is CustomSvgElement);
  //shouldBe(svg1.namespaceUri, "http://www.w3.org/2000/svg");

  var svg2 = document.createElementNS('http://www.w3.org/2000/svg', 'svg-foo');
  shouldBe(svg2.tagName, "svg-foo");
  shouldBe(svg2.namespaceUri, "http://www.w3.org/2000/svg");
  var svg3 = createElementFromSvg('<svg-foo></svg-foo>');
  shouldBe(svg3.tagName, "svg-foo");
  shouldBe(svg3.namespaceUri, "http://www.w3.org/2000/svg");

  var notSvg1 = document.createElement('svg-foo');
  shouldBe(notSvg1.namespaceUri, "http://www.w3.org/1999/xhtml");
  shouldBeFalse(notSvg1 is CustomSvgElement);
  shouldBeFalse(notSvg1 is UnknownElement);
  shouldBeTrue(notSvg1 is HtmlElement);
  var notSvg2 = createElementFromHtml('<svg-foo></svg-foo>');
  shouldBe(notSvg2.namespaceUri, "http://www.w3.org/1999/xhtml");
  shouldBeFalse(notSvg2 is CustomSvgElement);
  shouldBeFalse(notSvg2 is UnknownElement);
  shouldBeTrue(notSvg2 is HtmlElement);
}

