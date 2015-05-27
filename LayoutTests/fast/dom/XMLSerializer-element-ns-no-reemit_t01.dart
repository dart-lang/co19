/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description XmlSerializer: Don't emit redundant NS declarations
 */
import "dart:html";
import "../../resources/testharness.dart";

main() {
  test(() {
    var s = '<foo xmlns="http://www.w3.org/1999/xhtml"></foo>';
    var docFrag = new DomParser().parseFromString(s, 'text/xml');
    var root = docFrag.firstChild..remove();
    var child = document.createElementNS('http://www.w3.org/1999/xhtml', 'bar');
    child.append(new Text(''));
    root.append(child);
    var result1 = new XmlSerializer().serializeToString(root);
    assert_equals(result1, '<foo xmlns="http://www.w3.org/1999/xhtml"><bar></bar></foo>');
  }, 'XmlSerializer: Don\'t emit redundant declarations of the default NS.');

  test(() {
    var s = '<foo xmlns="http://www.w3.org/1999/xhtml" xmlns:baz="http://example.org/baz"></foo>';
    var docFrag = new DomParser().parseFromString(s, 'text/xml');
    var root = docFrag.firstChild..remove();
    var child = document.createElementNS('http://example.org/baz', 'baz:bar');
    child.append(new Text(''));
    root.append(child);
    var result1 = new XmlSerializer().serializeToString(root);
    assert_equals(result1, '<foo xmlns="http://www.w3.org/1999/xhtml" xmlns:baz="http://example.org/baz"><baz:bar></baz:bar></foo>');
  }, 'XmlSerializer: Don\'t emit redundant declarations of a prefix.');
}
