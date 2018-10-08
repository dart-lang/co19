/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that type extension of a element whose DOM interface is
 * HTMLElement does not assert
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <section id="a" is="x-a"></section>
    ''', treeSanitizer: new NullTreeSanitizer());

  var u = document.querySelector('#a');
  var v = document.createElement('section', 'x-a');
}
