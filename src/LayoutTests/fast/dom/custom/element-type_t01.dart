/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that changing an instantiated custom element's 'is'
 * attribute does not affect its element type.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

class X extends SpanElement {
  static const tag = 'x-x';
  factory X() => new Element.tag('span', tag);
  X.created() : super.created() {
    createdCallback();
  }
  static var createdCallback = () {};
}

class Y extends SpanElement {
  static const tag = 'x-y';
  factory Y() => new Element.tag('span', tag);
  Y.created() : super.created() {
    createdCallback();
  }
  static var createdCallback = () {};
}

main() {
  document.body.setInnerHtml('''
    <span is="x-x" id="a"></span>
    <div>PASS</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var a = document.querySelector("#a");
  a.setAttribute("is", "x-y");

  var createdCallCount = 0;
  var createdBy = '';
  onCreate(msg) {
    return () {
      createdBy = msg;
      createdCallCount++;
    };
  }

  X.createdCallback = onCreate('X');
  document.register('x-x', X, extendsTag: 'span');

  Y.createdCallback = onCreate('Y');
  document.register('x-y', Y, extendsTag: 'span');

  a = document.querySelector('#a');
  shouldBe(a.getAttribute("is"), "x-y");
  shouldBeTrue(a is X);
  shouldBe(createdBy, "X");
  shouldBe(createdCallCount, 1);
}
