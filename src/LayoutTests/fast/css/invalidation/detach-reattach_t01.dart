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
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
        .a { width: 100px; height: 100px; background-color: green; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="root"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var inner;
  var root = document.getElementById('root');
  var mid = document.createElement('div');
  root.append(mid);

  inner = document.createElement('div');
  mid.append(inner);

  inner.offsetTop;
  inner.classes.add('a');
  mid.remove();
  root.offsetTop;
  root.append(mid);
  inner.offsetTop;
  inner.classes.remove('a');

  shouldBe(getComputedStyle(inner).backgroundColor, "rgba(0, 0, 0, 0)");
}
