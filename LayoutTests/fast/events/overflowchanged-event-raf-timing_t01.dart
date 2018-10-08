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
  var f = new DocumentFragment.html('''
      <style>
          #scrollable { overflow: auto; height: 100px; width: 100px; }
          #inside.scroll { height: 2000px; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Tests that overflowchanged events are deferred until raf.</p>

      <div id="scrollable">
          <div id="inside"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var scrollable = document.getElementById('scrollable');
  var inside = document.getElementById('inside');

  var msgs = [];

  asyncStart();

  log(text) {
    msgs.add(text);
  }

  scrollable.addEventListener('overflowchanged', (_) {
    log('overflowchanged');
  });

  document.body.offsetTop;

  inside.classes.toggle('scroll');
  document.body.offsetTop;
  log('layout');

  inside.classes.toggle('scroll');
  document.body.offsetTop;
  log('layout');

  inside.classes.toggle('scroll');
  document.body.offsetTop;
  log('layout');

  window.requestAnimationFrame((_) {
    log('requestAnimationFrame');
    shouldBeList(msgs,
      ['layout', 'layout', 'layout',
       'overflowchanged', 'overflowchanged', 'overflowchanged',
       'requestAnimationFrame']);
    asyncEnd();
  });
}
