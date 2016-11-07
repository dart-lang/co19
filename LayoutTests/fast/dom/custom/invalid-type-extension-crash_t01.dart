/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Accessing an XML element that looks like a Custom Element
 * should not crash. 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var doc = new DomParser()
    .parseFromString('''
      <html xmlns="http://www.w3.org/1999/xhtml"><x-test is="x-a" id="t"></x-test>
      ''', 'text/xml');

  shouldBeTrue(doc.getElementById("t") is Element);
}

