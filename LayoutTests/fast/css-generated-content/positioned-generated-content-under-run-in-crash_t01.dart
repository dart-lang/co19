/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var style = new Element.html('''
      <style>
      .testclass::before { position: absolute; content: ""; }
      .testclass { display: run-in; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      PASS, if no exceptions or crash observed
      ''', treeSanitizer: new NullTreeSanitizer());

  var test1 = document.createElement('div');
  test1.setAttribute('class', 'testclass');
  document.documentElement.append(test1);
  var test2 = document.createElement('b');
  test2.setAttribute('class', 'testclass');
  document.documentElement.append(test2);
  var test3 = document.createElement('div');
  document.documentElement.append(test3);
}
