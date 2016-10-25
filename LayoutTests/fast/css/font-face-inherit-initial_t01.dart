/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test passes if it does not crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      @font-face {
          font-family: inherit;
      }

      @font-face {
          font-family: initial;
      }

      @font-face {
          font-family: test;
          src: inherit;
      }

      @font-face {
          font-family: test;
          src: initial;
      }

      @font-face {
          font-family: test;
          src: local(Times);
          font-style: inherit;
      }

      @font-face {
          font-family: test;
          src: local(Times);
          font-style: initial;
      }

      @font-face {
          font-family: test;
          src: local(Times);
          font-weight: inherit;
      }

      @font-face {
          font-family: test;
          src: local(Times);
          font-weight: initial;
      }

      @font-face {
          font-family: test;
          src: local(Times);
          font-stretch: inherit;
      }

      @font-face {
          font-family: test;
          src: local(Times);
          font-stretch: initial;
      }

      @font-face {
          font-family: test;
          src: local(Times);
          unicode-range: inherit;
      }

      @font-face {
          font-family: test;
          src: local(Times);
          unicode-range: initial;
      }

      @font-face {
          font-family: test;
          src: local(Times);
          font-variant: inherit;
      }

      @font-face {
          font-family: test;
          src: local(Times);
          font-variant: initial;
      }

      @font-face {
          font-family: test;
          src: local(Times);
          -webkit-font-feature-settings: inherit;
      }

      @font-face {
          font-family: test;
          src: local(Times);
          -webkit-font-feature-settings: initial;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.offsetTop;
}
