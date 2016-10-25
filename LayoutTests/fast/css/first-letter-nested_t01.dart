/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for first-letter for nested elements
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      .test:first-letter { color: green; }
      .boxed { border: solid 1px; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
  
  document.body.setInnerHtml('''
      <div id="description"></div>

      <p class="test" id="test_p_1">
          <span class="boxed" id="test_span_1">Span</span>
      </p>
      <p class="test">
          <span class="boxed" id="test_span_2" class="boxed">Span</span>
      </p>
      <p>
          <span class="boxed" id="ref_span" style="font-size:32px"><span style="color:green">S</span>pan</span>
      </p>

      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());
  
  document.body.offsetTop;

  document.getElementById('test_p_1').style.fontSize = '32px';
  document.getElementById('test_span_2').style.fontSize = '32px';

  document.body.offsetTop;

  description("The three spans below should look the same.");
  shouldBe(document.getElementById('test_span_1').offsetWidth, document.getElementById('ref_span').offsetWidth);
  shouldBe(document.getElementById('test_span_2').offsetWidth, document.getElementById('ref_span').offsetWidth);
}