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
  var style = new Element.html(''' 
    <style> body { white-space: pre; } </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <a><b></b></a>
    ''', treeSanitizer: new NullTreeSanitizer());

  var a = document.querySelector('a');
  var b = document.querySelector('b');
  var sr = a.createShadowRoot();
  sr.innerHtml = '<content></content>';
  var content = sr.firstChild;

  var log = [];
  var phases = {
    2: 'AT_TARGET',
    3: 'BUBBLING_PHASE',
    1: 'CAPTURING_PHASE',
  };

  [a, b, sr, content].forEach((el) {
    [true, false].forEach((b) {
      el.addEventListener('click', (event) {
        log.add([
          (event.target as Node).nodeName,
          (event.currentTarget as Node).nodeName,
          phases[event.eventPhase]
          ]);
      }, b);
    });
  });

  b.click();

  var expected = [
    ['B', 'A', 'CAPTURING_PHASE'],
    ['B', '#document-fragment', 'CAPTURING_PHASE'],
    ['B', 'CONTENT', 'CAPTURING_PHASE'],
    ['B', 'B', 'AT_TARGET'],
    ['B', 'B', 'AT_TARGET'],
    ['B', 'CONTENT', 'BUBBLING_PHASE'],
    ['B', '#document-fragment', 'BUBBLING_PHASE'],
    ['B', 'A', 'BUBBLING_PHASE']
  ];

  shouldBeList(log, expected); 
}
