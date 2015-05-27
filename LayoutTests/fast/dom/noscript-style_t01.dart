/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that noscript element is in DOM but can't be styled.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      noscript { display:block; position:absolute; width:100px; height:100px }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <noscript>abc</noscript>
      ''', treeSanitizer: new NullTreeSanitizer());

  var noscript = document.getElementsByTagName('noscript')[0];
  shouldBe(noscript.offsetWidth, 0);
}
