/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description document.register() in a createdCallback should upgrade
 * elements that are in the same processing queue.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../resources/testharness.dart";

class A extends HtmlElement {
  static const tag = 'x-a';
  factory A() => new Element.tag(tag);
  A.created() : super.created() {
    createdCallback(this);
  }
  void attributeChanged(String name, String oldValue, String newValue) {
    attributeChangedCallback(name, oldValue, newValue);
  }
  static var attributeChangedCallback = (x,y,z) {};
  static var createdCallback = (_) {};
}

class B extends HtmlElement {
  static const tag = 'x-b';
  factory B() => new Element.tag(tag);
  B.created() : super.created() {
    createdCallback(this);
  }
  void attributeChanged(String name, String oldValue, String newValue) {
    attributeChangedCallback(name, oldValue, newValue);
  }
  static var attributeChangedCallback = (x,y,z) {};
  static var createdCallback = (_) {};
}

main() {
  var createdElements = [];

  A.createdCallback = (self) {
    createdElements.add(self.id);
    B.createdCallback = (self) {
      createdElements.add(self.id);
    };

    document.register('x-b', B);
    setTimeout(() {
      assert_array_equals(createdElements, ['elemA0', 'elemB0', 'elemB1']);
      asyncEnd();
    });
  };

  document.register('x-a', A);

  asyncStart();
  document.body.setInnerHtml('''
    <x-b id='elemB0'></x-b>
    <x-a id='elemA0'></x-a>
    <x-b id='elemB1'></x-b>
    <div>PASS</div>
    ''', treeSanitizer: new NullTreeSanitizer());
}
