/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
//import "../../../testcommon.dart";
import "../../../resources/testharness.dart";

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

class B extends HtmlElement {
  static const tag = 'x-b';
  factory B() => new Element.tag(tag);
  B.created() : super.created() {
    createdCallback();
  }
  void attributeChanged(String name, String oldValue, String newValue) {
    attributeChangedCallback(name, oldValue, newValue);
  }
  static var attributeChangedCallback = (x,y,z) {};
  static var createdCallback = () {};
}

main() {
  test(() {
    var attributeChangedInvocations = 0;
    attributeChanged(x, y, z) {
      attributeChangedInvocations++;
    }

    A.attributeChangedCallback = attributeChanged;
    document.register('x-a', A);
    var element = new A();
    element.setAttribute('a', 'b');
    assert_equals(attributeChangedInvocations, 1, 'the attribute changed callback retrieved at registration must be invoked');
  }, 'transfer attribute changed callback');

  test(() {
    var invocations = [];
    created() {
      invocations.add('created');
    }
    attributeChanged(name, oldValue, newValue) {
      invocations.add(name + ': ' + oldValue.toString() + ' => ' + newValue.toString());
    }

    B.createdCallback = created;
    B.attributeChangedCallback = attributeChanged;
    document.register('x-b', B);

    var b = new B();
    b.id = 'x';
    assert_array_equals(invocations, ['created', 'id: null => x'], 'setting a reflected attribute should invoke the attributeChanged callback');

    invocations = [];
    b.attributes.remove('id');
    assert_array_equals(invocations, ['id: x => null'], 'removing an attribute should invoke the attributeChangedCallback');

    invocations = [];
    b.setAttribute('data-s', 't');
    assert_array_equals(invocations, ['data-s: null => t'], 'adding an attribute with setAttribute should invoke the attributeChangedCallback');

    invocations = [];
    b.classes.toggle('u');
    assert_array_equals(invocations, ['class: null => u'], 'adding a class attribute through classList should invoke the attributeChangedCallback');

    b.setAttribute('data-v', 'w');
    invocations = [];
    b.setAttribute('data-v', 'x');
    assert_array_equals(invocations, ['data-v: w => x'], 'changing an attribute with setAttribute should invoke the attributeChangedCallback');

    invocations = [];
    b.setAttribute('data-v', 'x');
    assert_array_equals(invocations, [], 'setting an attribute to the existing value with setAttribute should not invoke the attributeChangedCallback');
  }, 'add, change and remove an attribute');
}
