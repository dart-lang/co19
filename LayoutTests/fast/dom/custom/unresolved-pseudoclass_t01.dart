/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests the :unresolved pseudoclass.
 */
import "dart:html";
import "../../../testcommon.dart";

class X extends HtmlElement {
  static const tag = 'x-x';
  factory X() => new Element.tag(tag);
  X.created() : super.created();
}
class Y extends SpanElement {
  static const tag = 'x-y';
  factory Y() => new Element.tag('span', tag);
  Y.created() : super.created();
}

main() {
  var style = new Element.html('''
    <style>
    x-x {
      color: rgb(0, 222, 0);
    }

    [is=x-y]:not(:unresolved) {
      color: rgb(0, 111, 0);
    }

    :unresolved {
      color: rgb(0, 0, 222);
    }

    [is=x-y]:unresolved {
      border-color: rgb(0, 0, 111);
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <div id="container"></div>
    <x-x id="a"></x-x>
    <span id="b" is="x-y"></span>
    <div>PASS</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var a = document.querySelector('#a');
  shouldBe(document.querySelector("x-x:unresolved"), a);
  shouldBe(a.getComputedStyle().color, "rgb(0, 0, 222)");

  var b = document.querySelector('#b');
  shouldBe(b.getComputedStyle().color, "rgb(0, 0, 222)");
  shouldBe(b.getComputedStyle().borderColor, "rgb(0, 0, 111)");

  document.register('x-x', X);
  var c = new X();
  document.body.insertBefore(c, b);
  shouldBe(c.getComputedStyle().color, "rgb(0, 222, 0)");

  // Registering x-x should have changed the styles of #a.
  shouldBe(a.getComputedStyle().color, "rgb(0, 222, 0)");

  document.register('x-y', Y, extendsTag: 'span');
  var d = new Y();
  document.body.insertBefore(d, b);
  shouldBe(d.getComputedStyle().color, "rgb(0, 111, 0)");

  // Registering is="x-y" should have changed the styles of #b.
  shouldBe(b.getComputedStyle().color, "rgb(0, 111, 0)");
}

