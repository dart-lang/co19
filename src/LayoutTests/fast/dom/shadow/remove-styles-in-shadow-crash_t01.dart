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
    <!-- [Bug 100455], https://bugs.webkit.org/show_bug.cgi?id=100455 -->
    <!-- [Shadow]: removing styles in shadow dom subtree causes crash. -->
    <!-- If this test passes, we can see just "PASS" without any crashes. -->
    <div id="host"></div>  
    <div>PASS</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var host = document.getElementById('host');
  var sr = host.createShadowRoot();
  // Test the case: two styles are in shadow dom subtree and they are not
  // direct chilren of the shadow root.
  sr.innerHtml = '<div><style>div { color: blue; }</style>Hello</div><div><style>span { color: red }</style><span>World</span></div>';
  sr.innerHtml = '';

  // Test the case: two styles are in shadow dom subtree, but one is a direct
  // child of shadow root and scoped. The other is not a direct child and
  // not scoped.
  sr.innerHtml = '<style scoped>div { color: blue; }</style>Hello<div><style>span { color: red }</style><span>World</span></div>';
  sr.innerHtml = '';
}
