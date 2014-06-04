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

main() {
  document.body.setInnerHtml('''
    <xht:input id="test"></xht:input>
    <div>PASS<div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var source = document.getElementById('test');
  var imported = document.importNode(source, true);
  shouldBe(imported.runtimeType, source.runtimeType);
}
