/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This should not crash.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var style = new Element.html('''
      <style type="text/css" media="screen">
      
        @media screen {
          @font-face {
              font-family: Times;
              src: local("Arial");
          }
        }
      
        body {
          font-family: Times, sans-serif;
        }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
}
