/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Testing document.register() basic behaviors.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

class Foo extends HtmlElement {
  static const tag = 'x-foo';
  factory Foo() => new Element.tag(tag);
  Foo.created() : super.created();
  var someProperty;
}

class Bar extends HtmlElement {
  static const tag = 'x-bar';
  factory Bar() => new Element.tag(tag);
  Bar.created() : super.created();
}

class Baz extends Bar {
  static const tag = 'x-baz';
  factory Baz() => new Element.tag(tag);
  Baz.created() : super.created();
}

main() {
  document.body.setInnerHtml('''
    <div id="container"></div>,
    ''', treeSanitizer: new NullTreeSanitizer());

  document.register('x-foo', Foo);
  document.register("x-foo-2", Foo);

  debug('Register dart:dom base element');
  document.register("x-foo-element", HtmlElement);

  debug('Bad Custom Element: Extending a non element');
  shouldThrow(() => document.register("x-bad-node", Node));

  debug('Bad tag: x-foo tag is already registered');
  shouldThrow(() => document.register("x-foo", Foo));
  shouldThrow(() => document.register("x-foo", HtmlElement));

  debug('Constructor initiated instantiation');
  var createdFoo = new Foo();
  shouldBeTrue(createdFoo is Foo);

  debug('Native getter');
  shouldBe(createdFoo.tagName, "X-FOO");

  debug('Native setter');
  createdFoo.innerHtml = 'Hello';
  shouldBe(createdFoo.text, "Hello");

  debug('Native method');
  var childDiv = document.createElement('div');
  createdFoo.append(childDiv);
  shouldBe(createdFoo.lastChild, childDiv);

  debug('Parser initiated instantiation');
  var container = document.getElementById('container');
  container.setInnerHtml('<x-foo></x-foo>',
    treeSanitizer: new NullTreeSanitizer());
  var parsedFoo = container.firstChild;
  shouldBeTrue(parsedFoo is Foo);
  shouldBe(parsedFoo.tagName, "X-FOO");

  debug('Ensuring the wrapper is retained');
  parsedFoo.someProperty = 'hello';
  shouldBe(parsedFoo.someProperty, container.firstChild.someProperty);

  debug('Having another constructor');
  document.register('x-bar', Bar);
  var createdBar = new Bar();
  shouldBe(createdBar.tagName, "X-BAR");

  debug('Having a subclass');
  document.register('x-baz', Baz);
  var createdBaz = new Baz();
  shouldBe(createdBaz.tagName, "X-BAZ");
  shouldBeTrue(createdBaz is Bar);
  shouldBeTrue(createdBaz is Baz);

  debug('With irregular cases');
  var createdUpperBar = document.createElement('X-BAR');
  var createdMixedBar = document.createElement('X-Bar');
  shouldBeTrue(createdUpperBar is Bar);
  shouldBe(createdUpperBar.tagName, "X-BAR");
  shouldBeTrue(createdMixedBar is Bar);
  shouldBe(createdMixedBar.tagName, "X-BAR");

  container.setInnerHtml('<X-BAR></X-BAR><X-Bar></X-Bar>',
    treeSanitizer: new NullTreeSanitizer());
  shouldBeTrue(container.firstChild is Bar);
  shouldBe(container.firstChild.tagName, "X-BAR");
  shouldBeTrue(container.lastChild is Bar);
  shouldBe(container.lastChild.tagName, "X-BAR");

  debug("Constructors shouldn't interfere with each other");
  shouldBe((new Foo()).tagName, "X-FOO");
  shouldBe((new Bar()).tagName, "X-BAR");
  shouldBe((new Baz()).tagName, "X-BAZ");
}
