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
  var style = new Element.html('''
      <style>
        #el0 { position: relative; }
        #el2 { outline-style: dashed; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  test() {
    document.execCommand('removeformat', false, '');
    setTimeout(asyncEnd, 100);
  }

  //         This tests a crash caused by stale pointers to continuations in a block's continuations table.
  //         https://bugs.webkit.org/show_bug.cgi?id=81276

  runTest() {
    var el0=document.createElement('span');
    el0.setAttribute('id','el0');
    document.body.append(el0);
    var el1=document.createElement('div');
    el0.append(el1);
    el1.append(document.createElement('input'));
    el0.append(new Text('A'));
    var el2=document.createElement('q');
    el2.setAttribute('id','el2');
    document.body.append(el2);
    el2.append(document.createElement('div'));
    el2.append(document.createElement('input'));
    //document.designMode='on';
    document.execCommand('selectall', false, '');
    document.execCommand('FormatBlock', false, '<'+'pre>');
    document.execCommand('Undo', false, '');
    setTimeout(test,10);
  }

  asyncStart();
  runTest();
}
