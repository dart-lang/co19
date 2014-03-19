/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that the ClientRectList.item() argument is correctly 
 * validated.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
    <style>
    #testArea {
        width: 300px;
    }
    #inner {
        width: 200px;
        height: 200px;
    }
    .testBox {
        background-color: green;
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
 
  document.body.setInnerHtml('''
    <div id="testArea">
      <p>14. Block in inline</p>      <span id="testElement" class="testBox">Lorem<div id="inner"></div>ipsum</span>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var clientRects = document.getElementById("testElement").getClientRects();

  Expect.equals(3, clientRects.length);
  Expect.notEquals(null, clientRects.item(0));
  Expect.notEquals(null, clientRects.item(1));
  Expect.notEquals(null, clientRects.item(2));

  Expect.throws(() => clientRects.item());

  //Expect.equals(clientRects.item(2), clientRects.item(-4294967294)); // -4294967294 wraps to 2.

  // According to the specification, we should throw an IndexSizeError exception when index is
  // greater than the number of ClientRect objects associated with the object.
  // However, we currently just return null like Firefox 22.
  Expect.isNull(clientRects.item(3));
  Expect.isNull(clientRects.item(999));
  //Expect.isNull(clientRects.item(-1));
}

