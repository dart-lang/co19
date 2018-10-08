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

main() {
  var doc = new DomParser().parseFromString('''
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.1 Strict//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
</head>
<body>
    <div style="display: none">
    <span id="lower1">lower</span><br />
    <p id="UPPER1">UPPER</p><br />
    </div>''', 'text/xml');

  shouldBeNull(doc.querySelector('div SPAN'));

  shouldBeFalse(doc.getElementById('lower1').matches('div SPAN'));
}
