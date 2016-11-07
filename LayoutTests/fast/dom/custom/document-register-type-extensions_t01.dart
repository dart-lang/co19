/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Testing document.register() type extension behaviours
 * through createElement().
 */
import "dart:html";
import "../../../testcommon.dart";

class Foo extends HtmlElement {
  static const tag = 'x-foo';
  factory Foo() => new Element.tag(tag);
  Foo.created() : super.created();
}

class Foo2 extends HtmlElement {
  static const tag = 'x-foo';
  factory Foo2() => new Element.tag(tag);
  Foo2.created() : super.created();
}

class Bar extends InputElement {
  static const tag = 'x-bar';
  factory Bar() => new Element.tag('input', tag);
  Bar.created() : super.created();
}

class Baz extends Foo {
  static const tag = 'x-baz';
  factory Baz() => new Element.tag(tag);
  Baz.created() : super.created();
}

class Qux extends Bar {
  static const tag = 'x-qux';
  factory Qux() => new Element.tag('input', tag);
  Qux.created() : super.created();
}

main() {
  document.body.setInnerHtml('''
    <div id="container"></div>
    <form id="testForm"></form>
    ''', treeSanitizer: new NullTreeSanitizer());

  isFormControl(element) {
    var testForm = document.getElementById('testForm');
    testForm.append(element);
    return element.form == testForm;
  }

  //
  // Inheritance here is shaped like this:
  //
  // HtmlElement <- input <- x-bar <- x-qux
  //             <- x-foo <- x-baz
  //

  document.register('x-foo', Foo);
  document.register('x-bar', Bar, extendsTag: 'input');
  document.register('x-baz', Baz);
  document.register('x-qux', Qux, extendsTag: 'input');

  shouldThrow(() => document.register("x-foo", Foo2));

  //
  // Generated constructors
  //

  var fooNewed = new Foo();
  var fooOuterHtml = '<x-foo></x-foo>';
  shouldBeEqualToString(fooNewed.outerHtml, fooOuterHtml);
  shouldBeTrue(fooNewed is Foo && fooNewed is HtmlElement);
  shouldBeFalse(fooNewed is UnknownElement);

  var barNewed = new Bar();
  var barOuterHtml = '<input is="x-bar">';
  shouldBeEqualToString(barNewed.outerHtml, barOuterHtml);
  shouldBeTrue(barNewed is Bar && barNewed is InputElement);
  shouldBeTrue(isFormControl(barNewed));

  var bazNewed = new Baz();
  var bazOuterHtml = '<x-baz></x-baz>';
  shouldBeEqualToString(bazNewed.outerHtml, bazOuterHtml);
  shouldBeTrue(bazNewed is Baz && bazNewed is HtmlElement);
  shouldBeFalse(bazNewed is UnknownElement);

  var quxNewed = new Qux();
  var quxOuterHtml = '<input is="x-qux">';
  shouldBeTrue(quxNewed is Qux && quxNewed is Bar && quxNewed is InputElement);
  shouldBeEqualToString(quxNewed.outerHtml, quxOuterHtml);
  shouldBeTrue(isFormControl(quxNewed));

  //
  // Single parameter createElement()
  //

  var fooCreated = document.createElement('x-foo');
  shouldBeEqualToString(fooCreated.outerHtml, fooOuterHtml);
  shouldBeTrue(fooCreated is Foo);

  var barCreated = document.createElement('x-bar');
  shouldBeEqualToString(barCreated.outerHtml, '<x-bar></x-bar>');
  shouldBeFalse(barCreated is Bar);
  shouldBeFalse(barCreated is UnknownElement);
  shouldBeTrue(barCreated is HtmlElement);

  var bazCreated = document.createElement('x-baz');
  shouldBeEqualToString(bazCreated.outerHtml, '<x-baz></x-baz>');
  shouldBeTrue(bazCreated is Baz);
  shouldBeFalse(bazCreated is UnknownElement);

  var quxCreated = document.createElement('x-qux');
  shouldBeEqualToString(quxCreated.outerHtml, '<x-qux></x-qux>');
  shouldBeFalse(quxCreated is Qux);
  shouldBeFalse(quxCreated is UnknownElement);
  shouldBeTrue(quxCreated is HtmlElement);

  //
  // createElement() with type extensions
  //

  var divFooCreated = document.createElement('div', 'x-foo');
  shouldBeEqualToString(divFooCreated.outerHtml, '<div is="x-foo"></div>');
  shouldBeFalse(divFooCreated is Foo);
  shouldBeTrue(divFooCreated is DivElement);

  var inputBarCreated = document.createElement('input', 'x-bar');
  shouldBeEqualToString(inputBarCreated.outerHtml, barOuterHtml);
  shouldBeTrue(inputBarCreated is Bar);
  shouldBeFalse(inputBarCreated is UnknownElement);
  shouldBeTrue(isFormControl(inputBarCreated));

  var divBarCreated = document.createElement('div', 'x-bar');
  shouldBeEqualToString(divBarCreated.outerHtml, '<div is="x-bar"></div>');
  shouldBeFalse(divBarCreated is Bar);
  shouldBeTrue(divBarCreated is DivElement);

  var fooBarCreated = document.createElement('x-foo', 'x-bar');
  shouldBeEqualToString(fooBarCreated.outerHtml, '<x-foo is="x-bar"></x-foo>');
  shouldBeTrue(fooBarCreated is Foo);

  var barFooCreated = document.createElement('x-bar', 'x-foo');
  shouldBeEqualToString(barFooCreated.outerHtml, '<x-bar is="x-foo"></x-bar>');
  shouldBeFalse(barFooCreated is UnknownElement);
  shouldBeTrue(barFooCreated is HtmlElement);

  var fooCreatedNull = document.createElement('x-foo', null);
  shouldBeEqualToString(fooCreatedNull.outerHtml, fooOuterHtml);
  shouldBeTrue(fooCreatedNull is Foo);

  var fooCreatedEmpty = document.createElement('x-foo', '');
  shouldBeEqualToString(fooCreatedEmpty.outerHtml, fooOuterHtml);
  shouldBeTrue(fooCreatedEmpty is Foo);

  shouldThrow(() => document.createElement("@invalid", "x-bar"));

  //
  // createElementNS() with type extensions
  //

  var fooCreatedNS = document.createElementNS('http://www.w3.org/1999/xhtml', 'x-foo', null);
  shouldBeEqualToString(fooCreatedNS.outerHtml, fooOuterHtml);
  shouldBeTrue(fooCreatedNS is Foo);

  var barCreatedNS = document.createElementNS('http://www.w3.org/1999/xhtml', 'input', 'x-bar');
  shouldBeEqualToString(barCreatedNS.outerHtml, barOuterHtml);
  shouldBeTrue(barCreatedNS is Bar);
  shouldBeTrue(isFormControl(barCreatedNS));

  shouldThrow(() => document.createElementNS("http://example.com/2013/no-such-namespace", "xml:lang", "x-bar"));

  // parser
  createElementFromHtml(html) {
    var container = document.createElement('div');
    container.setInnerHtml(html, treeSanitizer: new NullTreeSanitizer());
    return container.firstChild;
  }

  var fooParsed = createElementFromHtml('<x-foo>');
  shouldBeTrue(fooParsed is Foo);

  var barParsed = createElementFromHtml('<input is="x-bar">');
  shouldBeTrue(barParsed is Bar);
  shouldBeTrue(isFormControl(barParsed));

  var divFooParsed = createElementFromHtml('<div is="x-foo">');
  shouldBeFalse(divFooParsed is Foo);
  shouldBeTrue(divFooParsed is DivElement);

  var namedBarParsed = createElementFromHtml('<x-bar>');
  shouldBeFalse(namedBarParsed is Bar);
  shouldBeFalse(namedBarParsed is UnknownElement);
  shouldBeTrue(namedBarParsed is HtmlElement);

  var divBarParsed = createElementFromHtml('<div is="x-bar">');
  shouldBeFalse(divBarParsed is Bar);
  shouldBeTrue(divBarParsed is DivElement);
}
