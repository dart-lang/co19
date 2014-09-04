/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      #test { position: absolute; width: 100px; height: 100px }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
 
  document.body.setInnerHtml('''
      Test that offsetWidth and similar get up to date style information even if a new stylesheet load is started at late stage of document rendering
      <link rel=stylesheet href="data:text/css,blah">
      <div id=test></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var test = document.getElementById('test');
  shouldBe(test.offsetWidth, 100);
}
