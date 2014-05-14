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
    <input id="sample">
    ''', treeSanitizer: new NullTreeSanitizer());

  var myShadowRoot = document.getElementById('sample').createShadowRoot();
  var myShadowElement = document.createElement('defs');
  myShadowElement.setAttribute('contenteditable', 'true');
  myShadowRoot.append(myShadowElement);
  myShadowElement.focus();
  document.body.innerHtml = 'PASS if this was not crashed.';
}
