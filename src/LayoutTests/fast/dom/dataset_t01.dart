/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests element.dataset.
 */
import "dart:html";
import "../../testcommon.dart";

_shouldThrow(func(), name) =>
  shouldThrow(func, (e) => e is DomException && e.name == name);

main() {
  testGet(attr, expected)
  {
    debug('Setting attribute "$attr", expecting dataset["$expected"]');
    var d = document.createElement("div");
    d.setAttribute(attr, "value");
    return d.dataset[expected] == "value";
  }

  shouldBeTrue(testGet('data-foo', 'foo'));
  shouldBeTrue(testGet('data-foo-bar', 'fooBar'));
  shouldBeTrue(testGet('data--', '-'));
  shouldBeTrue(testGet('data--foo', 'Foo'));
  shouldBeTrue(testGet('data---foo', '-Foo'));
  shouldBeTrue(testGet('data---foo--bar', '-Foo-Bar'));
  shouldBeTrue(testGet('data---foo---bar', '-Foo--Bar'));
  shouldBeTrue(testGet('data-foo-', 'foo-'));
  shouldBeTrue(testGet('data-foo--', 'foo--'));
  shouldBeTrue(testGet('data-Foo', 'foo')); // HTML lowercases all attributes.
  shouldBeTrue(testGet('data-', ''));
  shouldBeTrue(testGet('data-\xE0', '\xE0'));
  shouldBeTrue(testGet('data-1', '1'));
  shouldBeTrue(testGet('data-01', '01'));
  shouldBeTrue(testGet('data-zx81', 'zx81'));
  shouldBeTrue(testGet('data-i4770k', 'i4770k'));
  shouldBeTrue(testGet('data-r-7', 'r-7'));
  shouldBeTrue(testGet('data-r-7-k', 'r-7K'));
  shouldBe(document.body.dataset['nonExisting'], null);

  testIsUndefined(attr, prop)
  {
    debug('Setting attribute "$attr", expecting dataset["$prop"] in undefined');
    var d = document.createElement("div");
    d.setAttribute(attr, "value");
    return !d.dataset.containsKey(prop);
  }

  shouldBeTrue(testIsUndefined('data-022', '22'));
  shouldBeTrue(testIsUndefined('data-22', '022'));


  matchesNothingInDataset(attr)
  {
    debug('Setting attribute "$attr", expecting empty dataset');
    var d = document.createElement("div");
    d.setAttribute(attr, "value");

    return d.dataset.isEmpty;
  }

  shouldBeTrue(matchesNothingInDataset('dataFoo'));

  testSet(prop, expected)
  {
    debug('Setting dataset["$prop"], expecting attribute "$expected"');
    var d = document.createElement("div");
    d.dataset[prop] = "value";
    return d.getAttribute(expected) == "value";
  }

  shouldBeTrue(testSet('foo', 'data-foo'));
  shouldBeTrue(testSet('fooBar', 'data-foo-bar'));
  shouldBeTrue(testSet('-', 'data--'));
  shouldBeTrue(testSet('Foo', 'data--foo'));
  shouldBeTrue(testSet('-Foo', 'data---foo'));
  shouldBeTrue(testSet('', 'data-'));
  shouldBeTrue(testSet('\xE0', 'data-\xE0'));
  shouldBeTrue(testSet('32', 'data-32'));
  shouldBeTrue(testSet('0032', 'data-0032'));
  shouldBeTrue(testSet('i18n', 'data-i18n'));
  shouldBeTrue(testSet('d2', 'data-d2'));
  shouldBeTrue(testSet('2d', 'data-2d'));
  shouldBeTrue(testSet('d-2', 'data-d-2'));
  shouldBeTrue(testSet('A--S', 'data--a---s'));

  testIsNull(prop, attr)
  {
    debug('Setting dataset["$prop"], expecting attribute "$attr" is null');
    var d = document.createElement("div");
    d.dataset[prop] = "value";
    return d.getAttribute(attr) == null;
  }

  shouldBeTrue(testIsNull('0123', 'data-123'));
  shouldBeTrue(testIsNull('123', 'data-0123'));

  debug('test throws1');
  _shouldThrow(() => testSet('-foo', 'dummy'), DomException.SYNTAX);
  debug('test throws2');
  _shouldThrow(() => testSet('foo\x20', 'dummy'), DomException.INVALID_CHARACTER);
  debug('test throws3');
  _shouldThrow(() => testSet('foo\uF900', 'dummy'), DomException.INVALID_CHARACTER);

  testDelete(attr, prop)
  {
    debug('Setting attribute "$attr", removing dataset["$prop"]');
    var d = document.createElement("div");
    d.setAttribute(attr, "value");
    d.dataset.remove(prop);
    return d.getAttribute(attr) != "value";
  }

  shouldBeTrue(testDelete('data-foo', 'foo'));
  shouldBeTrue(testDelete('data-foo-bar', 'fooBar'));
  shouldBeTrue(testDelete('data--', '-'));
  shouldBeTrue(testDelete('data--foo', 'Foo'));
  shouldBeTrue(testDelete('data---foo', '-Foo'));
  shouldBeTrue(testDelete('data-', ''));
  shouldBeTrue(testDelete('data-\xE0', '\xE0'));
  shouldBeTrue(testDelete('data-33', '33'));
  shouldBeTrue(testDelete('data-00033', '00033'));
  shouldBeTrue(testDelete('data-r2', 'r2'));
  shouldBeTrue(testDelete('data-2r', '2r'));
  shouldBeTrue(testDelete('data-r-2', 'r-2'));
  shouldBeTrue(testDelete('data--r-2-', 'R-2-'));
  shouldBeTrue(testDelete('data--r-2r', 'R-2r'));
  shouldBeTrue(testDelete('data--r-2-----r', 'R-2----R'));

  shouldBeFalse(testDelete('dummy', '-foo'));
}
