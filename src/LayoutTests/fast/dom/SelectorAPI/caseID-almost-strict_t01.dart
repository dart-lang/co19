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
import "../../../testcommon.dart";

main() {
  var doc = new DomParser().parseFromString('''
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
  shouldBeNull(doc.querySelector('#LOWER2'));
  shouldBe(doc.querySelector('#UPPER1').text, 'UPPER 1');
  shouldBeNull(doc.querySelector('#upper2'));

  shouldBeTrue(doc.getElementById('lower1').matches('#lower1'));
  shouldBeFalse(doc.getElementById('lower2').matches('#LOWER2'));
  shouldBeTrue(doc.getElementById('UPPER1').matches('#UPPER1'));
  shouldBeFalse(doc.getElementById('UPPER2').matches('#upper2'));
}

