/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Element.xxx
 * Creates a new <xxx> element.
 * This is identical to calling new Element.tag('xxx').
 * @description Checks expected element types
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x;

  x = new Element.a();
  Expect.equals('A', x.tagName);

  x = new Element.article();
  Expect.equals('ARTICLE', x.tagName);

  x = new Element.aside();
  Expect.equals('ASIDE', x.tagName);

  x = new Element.audio();
  Expect.equals('AUDIO', x.tagName);

  x = new Element.br();
  Expect.equals('BR', x.tagName);

  x = new Element.canvas();
  Expect.equals('CANVAS', x.tagName);

  x = new Element.div();
  Expect.equals('DIV', x.tagName);

  x = new Element.footer();
  Expect.equals('FOOTER', x.tagName);

  x = new Element.header();
  Expect.equals('HEADER', x.tagName);

  x = new Element.hr();
  Expect.equals('HR', x.tagName);

  x = new Element.iframe();
  Expect.equals('IFRAME', x.tagName);

  x = new Element.img();
  Expect.equals('IMG', x.tagName);

  x = new Element.li();
  Expect.equals('LI', x.tagName);

  x = new Element.nav();
  Expect.equals('NAV', x.tagName);

  x = new Element.ol();
  Expect.equals('OL', x.tagName);

  x = new Element.option();
  Expect.equals('OPTION', x.tagName);

  x = new Element.p();
  Expect.equals('P', x.tagName);

  x = new Element.pre();
  Expect.equals('PRE', x.tagName);

  x = new Element.section();
  Expect.equals('SECTION', x.tagName);

  x = new Element.select();
  Expect.equals('SELECT', x.tagName);

  x = new Element.span();
  Expect.equals('SPAN', x.tagName);

  x = new Element.svg();
  Expect.equals('SVG', x.tagName);

  x = new Element.table();
  Expect.equals('TABLE', x.tagName);

  x = new Element.td();
  Expect.equals('TD', x.tagName);

  x = new Element.textarea();
  Expect.equals('TEXTAREA', x.tagName);

  x = new Element.th();
  Expect.equals('TH', x.tagName);

  x = new Element.tr();
  Expect.equals('TR', x.tagName);

  x = new Element.ul();
  Expect.equals('UL', x.tagName);

  x = new Element.video();
  Expect.equals('VIDEO', x.tagName);
}
