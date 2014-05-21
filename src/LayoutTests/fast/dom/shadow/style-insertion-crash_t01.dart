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

main() {
  document.body.setInnerHtml('''
    <div id="host"></div>
    ''', treeSanitizer: new NullTreeSanitizer());
  
  var host = document.getElementById('host');
  var sr = host.createShadowRoot();
  sr.innerHtml = '<style>@host { }</style><style></style>';
  var style = document.createElement('style');
  sr.insertBefore(style, lastElementChild(sr));

  testPassed("unless crash");
}