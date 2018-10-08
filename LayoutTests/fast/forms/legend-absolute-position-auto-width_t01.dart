/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks the absolute postioned legend element to honor
 * auto width.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var f = new DocumentFragment.html('''
      <style>
      fieldset {
          position: relative;
          padding-top: 30px;
          padding-left: 0px;
          padding-right: 0px;
          width: 200px;
          border: 1px solid green;
      }
      legend {
          background: green;
          left: 0;
          right: 0;
          top: 0;
          position: absolute;
          width: auto;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <fieldset>
          <legend id="legend">Legend</legend>
          <div>Fieldset content</div>
      </fieldset>
      ''', treeSanitizer: new NullTreeSanitizer());

  var legend = document.getElementById('legend');
  shouldBe(legend.offsetWidth, 200);
  shouldBe(legend.clientWidth, 200);
}
