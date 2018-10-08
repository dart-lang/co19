/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 *  This page verifies fix for bug 58247. WebKit should not crash when this 
 *  page is rendered.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <form><em><ol </del><fieldset  form="f"</sub><option </dt><button  form="f"></em><meter </time>
    ''', treeSanitizer: new NullTreeSanitizer());

  var div = document.createElement('div');
  div.innerHtml = 'PASS';
  document.body.append(div);
}
