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
    <foo id=tCF5><table><form id=tCF87>
    ''', treeSanitizer: new NullTreeSanitizer());

  var tCF5 = document.getElementById('tCF5');
  var tCF87 = document.getElementById('tCF87');
  tCF5.createShadowRoot().append(tCF87);
  document.body.innerHtml = 'PASS if not crashed.';
}
