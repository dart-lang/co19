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
      <style>
      #test1 {
          display: -webkit-flexbox;
      }
      #test1::before {
          content: "A";
      }
      #test2::before {
          content: "B";
          float: right;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());

  runTest(_) {
    document.body.offsetTop;

    var test1 = document.createElement('div');
    test1.setAttribute('id', 'test1');
    document.body.append(test1);

    var test2 = document.createElement('span'); 
    test2.setAttribute('id', 'test2');
    test1.append(test2);

    var test3 = document.createElement('div');
    test1.append(test3);
    var test3Child = document.createElement('div');
    test3.append(test3Child);

    document.body.offsetTop;
    test2.style.display = '-webkit-flexbox';

    document.body.offsetTop;
    document.body.innerHtml = "PASS";
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(runTest);
}
