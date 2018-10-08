/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "dart:svg";
import "../../../resources/testharness.dart";

class Div extends DivElement {
  static const tag = 'x-div';
  factory Div() => new Element.tag('div', tag);
  Div.created() : super.created();
}
class Unknown extends UnknownElement {
  static const tag = 'x-unknown';
  factory Unknown() => new Element.tag('unknown', tag);
  Unknown.created() : super.created();
}
class Use extends SvgElement {
  static const tag = 'x-use';
  factory Use() => new SvgElement.tag(tag); //? no .tag(tag,ext) ctor
  Use.created() : super.created();
}
class Sect extends HtmlElement {
  static const tag = 'x-sect';
  factory Sect() => new Element.tag('section', tag);
  Sect.created() : super.created();
}
class Augment extends ModElement {
  static const tag = 'x-augment';
  factory Augment() => new Element.tag('ins', tag);
  Augment.created() : super.created();
}
class Elide extends ModElement {
  static const tag = 'x-elide';
  factory Elide() => new Element.tag('del', tag);
  Elide.created() : super.created();
}
class Ins extends ModElement {
  static const tag = 'x-ins';
  factory Ins() => new Element.tag('InS', tag);
  Ins.created() : super.created();
}
class Bespoke extends HtmlElement {
  static const tag = 'x-bespoke';
  Bespoke.created() : super.created();
}

main() {
  test(() {
    document.register('x-div', Div, extendsTag: 'div');
    assert_equals(new Div().outerHtml, '<div is="x-div"></div>',
      'type extensions should have an "is" attribute');
    assert_equals(new Div().tagName, 'DIV',
      'tag name should be that of the base element');
  }, 'register a type extension');

  test(() {
    document.register('x-unknown', Unknown, extendsTag: 'unknown');
    assert_equals(new Unknown().outerHtml, '<unknown is="x-unknown"></unknown>');
  }, 'register a type extension of an unknown element');

  /*test(() {
    // registering an SVG element requires an SVGElement prototype
    document.register('x-use', Use, extendsTag: 'use');
    assert_equals(new Use().namespaceUri, 'http://www.w3.org/2000/svg',
      'SVG type extensions should have the SVG namespace');
  }, 'register a type extension of an SVG element');*/

  test(() {
    document.register('x-sect', Sect, extendsTag: 'section');
    assert_equals(new Sect().outerHtml, '<section is="x-sect"></section>');
  }, 'register a type extension of an element whose interface is HtmlElement');

  test(() {
    document.register('x-augment', Augment, extendsTag: 'ins');
    assert_equals(new Augment().outerHtml, '<ins is="x-augment"></ins>');
    document.register('x-elide', Elide, extendsTag: 'del');
    assert_equals(new Elide().outerHtml, '<del is="x-elide"></del>');
  }, 'register a type extensions of an interface with multiple element names');

  test(() {
    document.register('x-ins', Ins, extendsTag: 'InS');
    assert_equals(new Ins().tagName, 'INS',
      'tag name should be that of the base element');
  }, 'register a type extension with unusual case');

  test(() {
    assert_throws(() {
      document.register('x-bespoke', Bespoke, extendsTag: 'x-spoke');
    },
    'registering a type extension of a custom tag should fail');
  }, 'registering a type extension of a custom tag should fail');
}
