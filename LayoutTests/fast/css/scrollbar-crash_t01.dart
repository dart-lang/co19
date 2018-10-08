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
  var style = new Element.html('''
      <style>
      :horizontal {}
      :vertical {}
      :double-button {}
      :single-button {}
      :no-button {}
      :corner-present {}
      :increment {}
      :decrement {}
      :start {}
      :end {}
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>When scrollbar related pseudo types are specified, ASSERT should not be triggered.</p>
      <p>PASS unless crash.</p>
      ''', treeSanitizer: new NullTreeSanitizer());
}

