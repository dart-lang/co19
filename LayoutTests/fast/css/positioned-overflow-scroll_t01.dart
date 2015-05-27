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
import "../../../Utils/async_utils.dart";
import "../../resources/check-layout.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      div {
        overflow:scroll;
        position:absolute;
      }

      .box {
        display:block;
        background-color:green;
        width:100px;
        height:100px;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      Test that scrollbar width is added to the intrinsic width of different display types.
      <div style="top: 100px"><span class="box"></span></div>
      <div style="top: 100px; left: 150px; display: -webkit-box;"><span class="box"></span></div>
      <div style="top: 100px; left: 300px; -webkit-writing-mode: vertical-rl; overflow-x: hidden" data-no-horizontal-scrollbar><span class="box"></span></div>
      <div style="top: 100px; left: 450px; overflow-y: hidden" data-no-vertical-scrollbar><span class="box"></span></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var dummy = document.createElement('h1');
  dummy.style.overflow = 'scroll';
  document.body.append(dummy);
  var scrollbarWidth = dummy.offsetWidth - dummy.clientWidth;
  dummy.remove();

  document.body.querySelectorAll('div').forEach((node) {
    var width = 100;
    if (!node.attributes.containsKey('data-no-vertical-scrollbar'))
      width += scrollbarWidth;
    node.setAttribute('data-expected-width', width.toString());
    var height = 100;
    if (!node.attributes.containsKey('data-no-horizontal-scrollbar'))
      height += scrollbarWidth;
    node.setAttribute('data-expected-height', height.toString());
  });

  checkLayout('body');
}
