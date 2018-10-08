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
      .c6:first-letter { visibility: hidden; }
      .c6:nth-last-child(2n+10000000000000000) { text-align: -webkit-center; width: 10px; }
      .c26:first-letter { visibility: inherit; overflow: scroll; float: left;</style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  runTest(_) {
    var button = document.createElement('button');
    button.setAttribute('class', 'c6');
    document.documentElement.append(button);
    document.documentElement.append(document.createElement('dfn'));
    var figCaption = document.createElement('figcaption');
    figCaption.setAttribute('class', 'c26');
    document.documentElement.append(document.createElement('var'));
    document.documentElement.append(document.createElement('summary'));
    var text = new Text("bug 70183: Crash in RenderDeprecatedFlexibleBox::layoutHorizontalBox");
    figCaption.append(text);
    button.append(figCaption);
    document.body.offsetTop;
    document.documentElement.append(new Text("If this test did not CRASH or show errors in valgrind, it has PASSED."));
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(runTest);
}
