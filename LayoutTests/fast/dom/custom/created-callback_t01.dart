/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
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

class C extends HtmlElement {
  static const tag = 'x-c';
  factory C() => new Element.tag(tag);
  C.created() : super.created() {
    createdCallback(this);
  }
  void attributeChanged(String name, String oldValue, String newValue) {
    attributeChangedCallback(name, oldValue, newValue);
  }
  static var attributeChangedCallback = (x,y,z) {};
  static var createdCallback = (_) {};
}

main() {
  test(() {
    var createdInvocations = 0;
    created(_) {
      createdInvocations++;
    }

    A.createdCallback = created;
    document.register('x-a', A);
    var element = new A();
    assert_equals(createdInvocations, 1, 'the created callback retrieved at registration must be invoked');
  }, 'transfer created callback');

  test(() {
    var createdInvocations = 0;
    var div;
    var qwe = [];
    created(self) {
      qwe.add(self);
      createdInvocations++;

      if (self.id != 'u')
        return;

      var t = div.querySelector('#t');
      var v = div.querySelector('#v');
      var w = div.querySelector('#w');

      assert_equals(div.querySelector('x-b:not(:unresolved)'), self,
        'the :unresolved pseudoclass should cease to apply when the created callback is invoked');
      assert_array_equals(div.querySelectorAll(':unresolved'), [v, w],
        'the :unresolved pseudoclass should be processed in order');

      assert_true(t is C, 'prototype upgrade should happen in order (#t)');
      assert_false(v is C, 'prototype upgrade should happen in order (#v)');
    }

    document.register('x-b', B);

    C.createdCallback = created;
    document.register('x-c', C);

    div = document.createElement('div');
    div.setInnerHtml('<x-c id="t"></x-c>' +
      '<x-b id="u"></x-b>' +
      '<x-c id="v"></x-c>' +
      '<x-b id="w"></x-b>',
      treeSanitizer: new NullTreeSanitizer());
    assert_equals(createdInvocations, 2, 'the created callback should have been invoked once for each x-c element');
    assert_true(div.querySelector('#w') is B, '#w\'s prototype should have ultimately been upgraded');

  }, 'unresolved and created callback timing');
}
