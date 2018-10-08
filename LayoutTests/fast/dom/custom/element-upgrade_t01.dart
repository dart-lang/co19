/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests the element upgrade algorithm.
 * @needsreview
 */
import "dart:html";
import "../../../testcommon.dart";

class A extends HtmlElement {
  static const tag = 'x-a';
  factory A() => new Element.tag(tag);
  A.created() : super.created() {
    createdCallback();
  }
  static var createdCallback = () {};
}

class B extends SpanElement {
  static const tag = 'x-b';
  factory B() => new Element.tag('span', tag);
  B.created() : super.created() {
    createdCallback();
  }
  static var createdCallback = () {};
}

class C extends SpanElement {
  static const tag = 'x-c';
  factory C() => new Element.tag('span', tag);
  C.created() : super.created() {
    createdCallback();
  }
  static var createdCallback = () {};
}

class D extends DivElement {
  static const tag = 'x-d';
  factory D() => new Element.tag('div', tag);
  D.created() : super.created() {
    createdCallback();
  }
  static var createdCallback = () {};
}

class E extends HtmlElement {
  static const tag = 'x-e';
  factory E() => new Element.tag(tag);
  E.created() : super.created() {
    createdCallback(this);
  }
  static var createdCallback = (_) {};
}

main() {
  // "Element Upgrade" is the processing of custom elements which were
  // created before their definition was available, when the definition
  // becomes available. The following scenarios cover a lot but are not
  // exhaustive.

  // Scenario A: Custom tag; upgrade candidate is not in the document;
  // upgrade candidate did not have a JavaScript wrapper at upgrade
  // time; custom element does not have a created callback.
  debug('Scenario A');
  var host = document.createElement('div');
  host.setInnerHtml('<x-a></x-a>',  // Using setInnerHtml avoids wrapping x-a
    treeSanitizer: new NullTreeSanitizer());
  document.register('x-a', A);
  shouldBeTrue(host.firstChild is A);

  // Scenario B: Type extension; upgrade candidate is in the document;
  // upgrade candidate did have a JavaScript wrapper at upgrade time;
  // custom element has a created callback.
  debug('Scenario B');
  var element = document.createElement('span', 'x-b');
  var callCount = 0;
  B.createdCallback = () {
    callCount++;
  };
  document.register('x-b', B, extendsTag: 'span');
  //shouldBeTrue(element is B);
  shouldBe(callCount, 1);

  // Scenario C: The candidate is a custom tag but the definition is a
  // type extension. Upgrade should not happen.
  debug('Scenario C');
  element = document.createElement('x-c');
  document.register('x-c', C, extendsTag: 'span');
  shouldBeFalse(element is C);

  // Scenario D: The candidate is a type extension, but the definition
  // extends a different tag. Upgrade should not happen.
  debug('Scenario D');
  document.body.append(host);
  host.setInnerHtml('<span is="x-d"></span>', treeSanitizer: new NullTreeSanitizer());
  document.register('x-d', D, extendsTag: 'div');
  shouldBeFalse(host.firstChild is D);
  shouldBe(document.querySelector(":unresolved"), host.firstChild);

  // Scenario E: The order of upgrades should be the order of completing parsing.
  // Use a good number of elements to avoid false positives from random correct ordering.
  debug('Scenario E');
  host.setInnerHtml('<x-e id="e1"><x-e id="e2"></x-e></x-e><x-e id="e3"></x-e><x-e id="e4"></x-e><x-e id="e5"></x-e>',
      treeSanitizer: new NullTreeSanitizer());
  var upgradedOrder = [];
  E.createdCallback = (self) { upgradedOrder.add(self.id); };
  document.register('x-e', E);
  shouldBeList(upgradedOrder, ["e1","e2","e3","e4","e5"]);
}

