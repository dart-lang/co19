/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test will try to call focus() on a contenteditable div,
 * and then a normal div.  
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <br>The window should scroll to reveal the contenteditable div.
    <div style="width:500px;height:800px"></div>
    <div id="mydiv" style="border-style:solid" contenteditable>contentEditable div</div>
    <div id="result"></div>
    <div id="exc"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var pass = false;

  document.getElementById('mydiv').onFocus.listen((_) {
    pass = true;
  });
  debug('test1');
  document.getElementById('mydiv').focus();  //should not throw
  debug('test2');
  document.getElementById('result').focus(); //should not throw

  shouldBeTrue(pass);
}
