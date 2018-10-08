/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description PASS, if the script does not cause a crash or ASSERT failure
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style type="text/css">
          .parentStyle { position: absolute; }
          .parentStyle:first-letter { position: inherit; }
          .positionedChildStyle { position: absolute; }
          .divChildStyle:first-letter { float: left; }
          .divChildStyle:after { float: inherit; content: counter(blah); }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  runTest() {
    var parentDiv = document.createElement('div');
    parentDiv.setAttribute('class', 'parentStyle');
    document.documentElement.append(parentDiv);
    var positionedDiv = document.createElement('div');
    positionedDiv.setAttribute('class', 'positionedChildStyle');
    parentDiv.append(positionedDiv);
    var divChild = document.createElement('div');
    divChild.setAttribute('class', 'divChildStyle');
    parentDiv.append(divChild);
  }

  runTest();
}
