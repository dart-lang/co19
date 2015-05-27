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

main() {
  var style = new Element.html('''
      <style>
      .slider { -webkit-appearance: media-volume-slider-mute-button; }
      *:first-letter { pointer-events: fill; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div>
          <button></button>
          <table id="table" style="-webkit-column-span: all"></table>
      </div>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.body.setAttribute("style", "-webkit-column-count: 2");

  document.body.offsetHeight;
  document.body.append(document.createElement('div'));
  document.getElementById('table').className = 'slider';
}
