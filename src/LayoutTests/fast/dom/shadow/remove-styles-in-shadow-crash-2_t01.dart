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
    <style>
    .foo { color: green; }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <div id='sandbox'></div>
    <div class='foo'></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var host = document.getElementById('sandbox');
  var sr =  host.createShadowRoot();
  sr.innerHtml = '<div><style>div { color: red; }</style><div>Hello</div></div><div><style>.foo { color: red; }</style><div class="foo">Hello</div></div>';
  sr.innerHtml = '';
  var div = document.createElement('div');
  div.className = 'foo';
  div.text = 'PASS';
  document.body.append(div);
}
