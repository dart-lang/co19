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
      audio:after,
      audio:before {
          display: inline;
          content: no-close-quote;
      }
      video:after,
      video:before {
          display: inline;
          content: no-close-quote;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <audio controls></audio>

      <video controls></video>

      <p>Should not crash when ::before or ::after is used on media elements</p>
      ''', treeSanitizer: new NullTreeSanitizer());
}


