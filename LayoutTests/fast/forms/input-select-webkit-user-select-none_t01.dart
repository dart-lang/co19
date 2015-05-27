/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests user-select:none doesn't affect select()
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var f = new DocumentFragment.html('''
      <style>
      #sample {
          -webkit-user-select: none;
          user-select: none;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <div id="container">
      <p id="description"></p>
      Manual step
      <ol>
          <li>Click text input to focus it</li>
          <li>Hit Ctrl+A to select contents of text input</li>
      </ol>
      <input id="sample" value="foobar">
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  $(id) { return document.getElementById(id); }

  var sample = $('sample');
  sample.focus();
  sample.select();
  shouldBe(sample.selectionStart, 0);
  shouldBe(sample.selectionEnd, sample.value.length);
}
