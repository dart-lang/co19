/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description createDocument tests modeled after mozilla's testing
 */
import "dart:html";
import "../../../../Utils/expect.dart";

main() {
  var impl = document.implementation;
  test(impl);
}

test(dynamic impl) {
  Expect.throws(() {
    impl.createDocumentType('foo');
  }, (e) => e is NoSuchMethodError,
  'test1');

  Expect.throws(() {
    impl.createDocumentType('foo', '');
  }, (e) => e is NoSuchMethodError,
  'test2');

  Expect.throws(() {
    impl.createDocumentType('a:', '', '');
  }, (e) => e is DomException && e.name == DomException.NAMESPACE,
  'test3');

  Expect.throws(() {
    impl.createDocumentType(':foo', '', '');
  }, (e) => e is DomException && e.name == DomException.NAMESPACE,
  'test4');

  Expect.throws(() {
    impl.createDocumentType(':', '', '');
  }, (e) => e is DomException && e.name == DomException.NAMESPACE,
  'test5');

  try {
    impl.createDocumentType('foo', '', '');
  } catch (e) {
    Expect.fail('test6: ' + e.toString());
  }

  try {
    impl.createDocumentType('foo:bar', '', '');
  } catch (e) {
    Expect.fail('test7: ' + e.toString());
  }

  Expect.throws(() {
    impl.createDocumentType('foo::bar', '', '');
  }, (e) => e is DomException && e.name == DomException.NAMESPACE,
  'test8');

  Expect.throws(() {
    impl.createDocumentType('\t:bar', '', '');
  }, (e) => e is DomException && e.name == DomException.INVALID_CHARACTER,
  'test9');

  Expect.throws(() {
    impl.createDocumentType('foo:\t', '', '');
  }, (e) => e is DomException && e.name == DomException.INVALID_CHARACTER,
  'test10');

  Expect.throws(() {
    impl.createDocumentType('foo :bar', '', '');
  }, (e) => e is DomException && e.name == DomException.INVALID_CHARACTER,
  'test11');

  Expect.throws(() {
    impl.createDocumentType('foo: bar', '', '');
  }, (e) => e is DomException && e.name == DomException.INVALID_CHARACTER,
  'test12');

  Expect.throws(() {
    impl.createDocumentType('a:b:c', '', '');
  }, (e) => e is DomException && e.name == DomException.NAMESPACE,
  'test13');
}


