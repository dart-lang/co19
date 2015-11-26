/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description
 */
import "dart:html";
import "../../testharness.dart";
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
  <style>
    .block { display: block; background: green; }
    .inline { display: inline; margin-left: 40px; font: 30px/1 Ahem;}
    span { width: 50%; background: white; }
    .absolute { position: absolute; }
    .float { float: left; }
  </style> 
''';

const String htmlEL2 = r'''
  <p> https://bugs.webkit.org/show_bug.cgi?id=95772: There should be six green bars below with a PASS in each. </p>
  <div class="block">
   <div class="inline" data-expected-height="30"> <span class="absolute"></span> <span class="absolute"></span> </div> 
  </div>
  <div class="block">
   <div class="inline" data-expected-height="30"><span class="absolute"></span><span class="absolute"></span></div> 
  </div>
  <div class="block">
   <div class="inline" data-expected-height="30"><span class="float"></span><span class="float"></span></div>
  </div>
  <div class="block">
   <div class="inline" data-expected-height="30"> <span class="float"></span> <span class="float"></span></div>
  </div>
  <div class="block">
   <div class="inline" data-expected-height="30"><span></span><span></span></div>
  </div>
  <div class="block">
   <div class="inline" data-expected-height="30"> <span></span> <span></span></div>
  </div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    checkLayout('body > div > div');
}
