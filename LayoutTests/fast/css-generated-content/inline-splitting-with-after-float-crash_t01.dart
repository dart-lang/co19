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
          .c2:after { float: left; content: "A"; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      PASS, if the script does not cause a crash or ASSERT failure
      ''', treeSanitizer: new NullTreeSanitizer());

  var divToInsert;

  endTest(childSpan) {
    childSpan.append(divToInsert);
    asyncEnd();
  }

  startTest(_) {
    var quoteNode = document.createElement('q');
    document.documentElement.append(quoteNode);
    divToInsert = document.createElement('div');
    var parentSpan = document.createElement('span');
    parentSpan.setAttribute('class', 'c2');
    var childSpan = document.createElement('span');
    parentSpan.append(childSpan);
    document.documentElement.append(parentSpan);
    setTimeout(() => endTest(childSpan), 50);
  }

  asyncStart();
  window.onLoad.listen(startTest);
}
