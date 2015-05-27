/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <ol>
      <li>1</li>
      <li>2</li>
    </ol>
    ''', treeSanitizer: new NullTreeSanitizer());

  document.body.offsetLeft;
  var video = document.createElement('video');
  var ol = document.querySelector('ol');
  document.body.append(video);
  ol.setAttribute('reversed', 'reversed');
}
