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
    <p>This test checks for a crash that once happened due to cloned nodes copying style
    declaration pointers without retaining them.
    </p>
    <hr>
    <p>PASS: You didn't crash.</p>

    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    <div style="width: 100px;">hello world</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  garbageCollect()
  {
    for (var i = 0; i < 10000; i++) {
      var o = new Object();
    }
  }

  // Create an army of clones, removing the originals.

  var divClones = [];

  var div;
  while ((div=document.body.querySelector('div')) != null) {
    divClones.add(div.clone(false));
    div.remove();
  }

  // Garbage collect to force destruction of the originals.

  garbageCollect();

  // Now try setting properties on the clones' style declarations.

  for (var i = 0; i < divClones.length; i++) {
    divClones[i].style.width = "100px";
  }
}
