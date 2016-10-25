/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Pass if no crash or assert in debug
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      .writable{-webkit-user-modify:read-write;}
      .list{content:normal;display:list-item;}
      *:first-letter{stroke-linecap:round;}
      *:only-child{font-variant-ligatures:common-ligatures;text-transform:capitalize;</style>
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <span class="writable" id="span">
      <label class="list">
      <code>
      <object></object>
      </code></label></span>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

    document.getElementById('span').focus();
}

