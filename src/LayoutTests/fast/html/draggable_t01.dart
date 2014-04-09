/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description HTML5 Draggable
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var body = document.body;

  var style = new Element.html('''
    <style>
    [draggable="true"] {
        outline: 1px solid lime;
    }

    [draggable="false"] {
        outline: 1px solid pink;
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  var path = '$root/resources/images/lime.png';

  body.setInnerHtml('''
    <h2>Intrinsic</h2>

    <img src="$path">
    <a href="http://webgkit.org">webkit.org</a>
    <a>&lt;a no href&gt;</a>
    <span>&lt;span&gt;</span>

    <h2>draggable attr set to true</h2>

    <img src="$path" draggable="true">
    <a href="http://webgkit.org" draggable="true">webkit.org</a>
    <a draggable="true">&lt;a no href&gt;</a>
    <span draggable="true">&lt;span&gt;</span>

    <h2>draggable attr set to false</h2>

    <img src="$path" draggable="false">
    <a href="http://webgkit.org" draggable="false">webkit.org</a>
    <a draggable="false">&lt;a no href&gt;</a>
    <span draggable="false">&lt;span&gt;</span>

    <h2>draggable attr set to maybe</h2>

    <img src="$path" draggable="maybe">
    <a href="http://webgkit.org" draggable="maybe">webkit.org</a>
    <a draggable="maybe">&lt;a no href&gt;</a>
    <span draggable="maybe">&lt;span&gt;</span>

    <h2>draggable dom prop set to true</h2>

    <img src="$path">
    <a href="http://webgkit.org">webkit.org</a>
    <a>&lt;a no href&gt;</a>
    <span>&lt;span&gt;</span>

    <h2>draggable dom prop set to false</h2>

    <img src="$path">
    <a href="http://webgkit.org">webkit.org</a>
    <a>&lt;a no href&gt;</a>
    <span>&lt;span&gt;</span>
    ''', treeSanitizer: new NullTreeSanitizer());

  test()
  {
    var elements = document.querySelectorAll('body > :not(h2)');

    //Expect.equals(0, elements.length);

    for (var i = 16; i < 24; i++) {
      elements[i].draggable = i < 20;
    }
    
    var s = 'dom - attr\n----------\n';
    for (var i = 0; i < elements.length; i++) {
      s += elements[i].draggable.toString() + ' - ' + 
        elements[i].getAttribute('draggable').toString() + '\n';
    }

    Expect.equals('''
dom - attr
----------
true - null
true - null
false - null
false - null
true - true
true - true
true - true
true - true
false - false
false - false
false - false
false - false
true - maybe
true - maybe
false - maybe
false - maybe
true - true
true - true
true - true
true - true
false - false
false - false
false - false
false - false
''', s);

  };

  /*document.ondragstart = function(e)
  {
    e.dataTransfer.setData('Text', e.target.textContent || e.target.src || e.target.href);
  };*/

  test();
}
