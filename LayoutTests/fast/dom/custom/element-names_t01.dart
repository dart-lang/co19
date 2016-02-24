/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../resources/testharness.dart";

class C extends HtmlElement {
  C.created() : super.created();
}
class Foo extends HtmlElement {
  static const tag = 'x-foo';
  factory Foo() => new Element.tag(tag);
  Foo.created() : super.created();
}
class Bar1 extends HtmlElement {
  static const tag = 'y-bar';
  factory Bar1() => new Element.tag(tag);
  Bar1.created() : super.created();
}
class Bar2 extends HtmlElement {
  static const tag = 'yz-bar';
  factory Bar2() => new Element.tag(tag);
  Bar2.created() : super.created();
}
class Bar3 extends HtmlElement {
  static const tag = 'y-z-bar';
  factory Bar3() => new Element.tag(tag);
  Bar3.created() : super.created();
}
class Bar4 extends HtmlElement {
  static const tag = 'y--bar';
  factory Bar4() => new Element.tag(tag);
  Bar4.created() : super.created();
}

main() {
  test(() {
    var invalidNames = [
    // Hyphen missing:
    'foo',
    'xfoo',
    // Reserved names:
    // hyphen-containing names from the applicable specifications,
    // namely the SVG and the MathML.
    'annotation-xml',
    'color-profile',
    'font-face',
    'font-face-src',
    'font-face-uri',
    'font-face-format',
    'font-face-name',
    'missing-glyph',
    // names containing colon
    ':-xfoo',
    'xfoo-:yfoo',
    // names containing uppercase ASCII letters
    'xx-Foo',
    'X-Men',
    'ab-cdE'
    ];

    for (var i = 0; i < invalidNames.length; i++) {
      var invalidName = invalidNames[i];
      assert_throws(() {
        document.registerElement(invalidName, C);
      }, 'Successfully registered custom element with invalid name: ' + invalidName);
    }
  }, 'Invalid and reserved names');

  test((){
    document.registerElement('x-foo', Foo);
    assert_throws(() {
      document.registerElement('x-foo', Foo);
    }, 'Register already registered "x-foo"');
    assert_throws(() {
      document.registerElement('X-FOO', Foo);
    }, 'Register "X-FOO", same as already registered "x-foo"');
  }, 'Name conflicts');

  test(() {
    var validNameClassMap = {
      'y-bar':   Bar1,
      'yz-bar':  Bar2,
      'y-z-bar': Bar3,
      'y--bar' : Bar4
    };
    for(var elementName in validNameClassMap.keys) {
      var expectedTagName = elementName.toUpperCase();
      var klass = validNameClassMap[elementName];
      document.registerElement(elementName, klass);
      var tagName = document.createElement(elementName).tagName;
      assert_equals(tagName, expectedTagName, tagName + ' must be treated as a custom element');
    }
  }, 'Strange but valid names');
}
