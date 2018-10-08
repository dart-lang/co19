/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that partial layout works with overlay scrollbars.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../resources/testharness.dart";

main() {
  var style = new Element.html('''
      <style>
      * {
          margin: 0;
          padding: 0;
      }

      #makespace {
          height: 5000px;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="makespace"></div>
      <div id="measure"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();

  setTimeout(() {
    setTimeout(() {
      var measure = document.getElementById('measure');
      var measureWidth = measure.offsetWidth; // Partial layout occurs here!

      assert_equals(measureWidth, document.body.offsetWidth);
      assert_equals(measureWidth, window.innerWidth);
      asyncEnd();
    });
  }, 0);
}
