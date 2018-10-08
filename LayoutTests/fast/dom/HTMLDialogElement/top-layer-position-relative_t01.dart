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
import "../../../resources/check-layout.dart";

main() {
  var style = new Element.html('''
    <style>
    .green-box {
        background-color: green;
        height: 50px;
        width: 50px;
        border: none;
        padding: 0;
        margin: 0;
    }

    #left-div {
        position: absolute;
        top: 100px;
        left: 100px;
    }

    #middle-dialog {
        position: relative;
        top: 100px;
        left: 150px;
    }

    #right-dialog {
        position: relative;
        top: 100px;
        left: 200px;
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <p>Bug <a href="http://webkit.org/b/106538">106538</a>: Top layer fails for inline elements
    <p>This tests that position 'relative' computes to 'absolute' in the top layer. The test passes if you see a single green box.</p>
    <div id="left-div" class="green-box"></div>
    <dialog id="middle-dialog" class="green-box" data-offset-x="150" data-offset-y="100"></dialog>
    <dialog id="right-dialog" class="green-box" data-offset-x="200" data-offset-y="100"></dialog>
    ''', treeSanitizer: new NullTreeSanitizer());

  (document.getElementById('middle-dialog') as DialogElement).showModal();
  DialogElement rightDialog = document.getElementById('right-dialog');
  rightDialog.showModal();
  rightDialog.style.position = 'absolute';

  checkLayout('dialog');
}
