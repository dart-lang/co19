/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test wholeText and replaceWholeText
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var para = document.createElement('p');
  para.append(new Text('A'));
  var textB = new Text('B');
  para.append(textB);
  para.append(document.createElement('p'));
  para.append(new Text('C'));

  shouldBe(textB.wholeText, 'AB');
  shouldBe(para.text, 'ABC');

  //dart has no replaceWholeText
  //textB.replaceWholeText("XYZ");
  //shouldBe(textB.wholeText, 'XYZ');
  //shouldBe(para.textContent, 'XYZC');
}
