/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that custom element constructors run the createdCallback
 * synchronously.
 */
import "dart:html";
import "../../../testcommon.dart";

class A extends HtmlElement {
  static const tag = 'x-a';
  factory A() => new Element.tag(tag);
  A.created() : super.created() {
    createdCallback();
  }
  void attributeChanged(String name, String oldValue, String newValue) {
    attributeChangedCallback(name, oldValue, newValue);
  }
  static var attributeChangedCallback = (x,y,z) {};
  static var createdCallback = () {};
}

main() {
  var ncallbacks = 0;
  A.createdCallback = () {
    ncallbacks++;
  }; 
  document.register('x-a', A);
  var x = new A();
  shouldBe(ncallbacks, 1);
}
