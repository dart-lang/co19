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
  crash(_) {
    var test1 = document.createElement('header');
    var test2 = document.createElement('footer');
    var test3 = document.createElement('address');
    test3.setAttribute('class', 'class1');
    test1.append(test3);
    var test4 = document.createElement('nav');
    test4.setAttribute('class', 'class3');
    document.documentElement.append(test4);
    var test5 = document.createElement('dt');
    test5.setAttribute('class', 'class2');
    var test6 = document.createElement('a');
    document.documentElement.append(test6);
    var test7 = document.createElement('div');
    test7.setAttribute('class', 'class3');
    test5.append(test7);
    test5.append(test1);
    test4.append(test5);
    document.documentElement.offsetTop;
    test5.setAttribute('class', 'class3');
    document.documentElement.offsetTop;
    test2.append(test6);
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(crash);

  document.body.setInnerHtml('''
      <style>
          .class1 { -webkit-column-span: all; }
          .class2 > .class3 { float: right; content: open-quote; }
          .class3:last-of-type { -webkit-column-width: 1px; }
          .class3:nth-last-child(2n+10000000000000000) { -webkit-column-span: all;</style>
      </script>
      <p><a href="https://bugs.webkit.org/show_bug.cgi?id=107189">Bug 107189</a>: Regression(r131539): Heap-use-after-free in WebCore::RenderBlock::willBeDestroyed</p>
      <p>This test has PASSED if it didn't CRASH.</p>
      ''', treeSanitizer: new NullTreeSanitizer());
}

