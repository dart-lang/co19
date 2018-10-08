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
  document.body.setInnerHtml('''
    <div id="container">
            <p>This is a simple test of both importNode and cloneNode, created from an example that demonstrated a bug in importNode.</p>
            <div style="background: yellow;">The original node:</div>
            <div id="original" style="background: #7F7FFF; padding: 3px">Outer bit<div style="color: yellow; background: blue; margin: 3px;">Inner bit.</div></div>
            <div style="background: yellow;">Copied with importNode():</div>
            <div id="cloneTitle" style="background: yellow;">Copied with cloneNode():</div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  Element imported = document.getElementById('container')
    .insertBefore(document.importNode(document.getElementById('original'),true),
        document.getElementById('cloneTitle'));
  Element cloned = document.getElementById('container')
    .append(document.getElementById('original').clone(true));

  shouldBe(imported.getAttribute('style'), 'background: #7F7FFF; padding: 3px');
  shouldBe(cloned.getAttribute('style'), 'background: #7F7FFF; padding: 3px');
}
