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
<html>
<head>
</head>
<body>
    <div style="display: none">
    <span id="lower1">lower 1</span><br>
    <span id="lower2">lower 2</span><br>
    <span id="UPPER1">UPPER 1</span><br>
    <span id="UPPER2">UPPER 2</span><br>
    </div>
</body>''', 'text/html');

  shouldBe(doc.querySelector('#lower1').text, 'lower 1');
  shouldBe(doc.querySelector('#LOWER2').text, 'lower 2');
  shouldBe(doc.querySelector('#UPPER1').text, 'UPPER 1');
  shouldBe(doc.querySelector('#upper2').text, 'UPPER 2');

  shouldBeTrue(doc.getElementById('lower1').matches('#lower1'));
  shouldBeTrue(doc.getElementById('lower2').matches('#LOWER2'));
  shouldBeTrue(doc.getElementById('UPPER1').matches('#UPPER1'));
  shouldBeTrue(doc.getElementById('UPPER2').matches('#upper2'));
}
