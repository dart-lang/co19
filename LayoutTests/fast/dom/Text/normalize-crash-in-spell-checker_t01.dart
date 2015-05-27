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
  document.body.setInnerHtml('''
    <div id="sample" contenteditable="true"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  $(id) => document.getElementById(id);

  var text1 = new Text('abc');
  var text2 = new Text(' defg');
  var sample = $('sample');
  sample.append(text1);
  sample.append(text2);
  var selection = window.getSelection();
  selection.collapse(sample, 0);
  selection.extend(sample, 2);
  //sample.normalize(); //no normalize in dart

  document.body.text= 'PASS; NOT CRASHED';
}
