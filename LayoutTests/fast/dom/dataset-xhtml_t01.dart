/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests element.dataset for XHTML.
 */
import "dart:html";
import "../../testcommon.dart";

_shouldThrow(func(), name) =>
  shouldThrow(func, (e) => e is DomException && e.name == name);

main() {
  var doc = new DomParser()
    .parseFromString('''
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
</head>
<body>
</body>
</html>
      ''', 'text/xml');

  testGet(attr, expected)
  {
    debug('Setting attribute "$attr", expecting dataset["$expected"]');
    var d = doc.createElement("div");
    d.setAttribute(attr, "value");
    return d.dataset[expected] == "value";
  }

  shouldBeTrue(testGet('data-foo', 'foo'));
  shouldBeTrue(testGet('data-foo-bar', 'fooBar'));
  shouldBeTrue(testGet('data--', '-'));
  shouldBeTrue(testGet('data--foo', 'Foo'));
  shouldBeTrue(testGet('data---foo', '-Foo'));
  shouldBeTrue(testGet('data-', ''));
  shouldBeTrue(testGet('data-\xE0', '\xE0'));

  matchesNothingInDataset(attr)
  {
    debug('Setting attribute "$attr", expecting empty dataset');
    var d = doc.createElement("div");
    d.setAttribute(attr, "value");

    return d.dataset.isEmpty;
  }

  shouldBeTrue(matchesNothingInDataset('dataFoo'));
  shouldBeTrue(matchesNothingInDataset('data-Foo'));

  testSet(prop, expected)
  {
    debug('Setting dataset["$prop"], expecting attribute "$expected"');
    var d = doc.createElement("div");
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

  debug('test throws1');
  _shouldThrow(() => testSet('-foo', 'dummy'), DomException.SYNTAX);
  debug('test throws2');
  _shouldThrow(() => testSet('foo\x20', 'dummy'), DomException.INVALID_CHARACTER);
  debug('test throws3');
  _shouldThrow(() => testSet('foo\uF900', 'dummy'), DomException.INVALID_CHARACTER);

  testDelete(attr, prop)
  {
    debug('Setting attribute "$attr", removing dataset["$prop"]');
    var d = doc.createElement("div");
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

  shouldBeFalse(testDelete('dummy', '-foo'));
}
