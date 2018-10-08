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

class Data {
  var expectedElementID;
  var expectedOffsetX;
  var expectedOffsetY;
}

main() {
  var f = new DocumentFragment.html('''
<meta name="viewport" content="initial-scale=1, minimum-scale=1, maximum-scale=1">
<style>
* {
    margin: 0;
    padding: 0;
}

body {
    height: 2048px;
    width: 2048px;
    cursor: crosshair; /* Debugging */
}

.box {
    width: 200px;
    height: 100px;
    border: 10px solid gray;
}

.line {
    width:150px;
    height:20px;
    background: gray;
}

.target {
    background: lightGreen !important; /* Elements we click on are green */
}

#absolute {
    position: absolute;
    left: 100px;
    top: 125px;
}

#relative {
    position: relative;
    left: 40px;
    top: -50px;
}

#fixed {
    position: fixed;
    top: 50px;
    left: 200px;
    height: 50px;
}

#filler {
    position: absolute;
    top: 0;
    width: 100%;
    height: 100%;
}

table {
    margin-top: 300px;
    margin-left: 40px;
    width: 400px;
}

th { height: 30px; }

#table-content {
    position: relative;
    border: 10px solid gray;
}

#columns {
    position: absolute;
    width: 400px;
    height: 200px;
    top: 220px;
    left: 500px;
    border: 1px solid black;
    -webkit-column-count: 3;
    column-count: 3;
    column-fill: auto;
}

.column-line {
    width: 100px;
    height: 20px;
    background: gray;
}

#transformed {
    position: absolute;
    top: 470px;
    height: 120px;
    width: 200px;
    -webkit-transform: translate(100px, 50px) rotate(20deg);
}

#overflow {
    overflow: hidden; /* No scrollbars */
    position: absolute;
    width: 300px;
    height: 200px;
    top: 450px;
    left: 470px;
    border: 1px solid black;
    direction: rtl;
}

#overflow-contents {
    height: 500px;
    width: 120%;
}

#inside-overflow {
    height: 550px;
    width: 50%;
}

#results {
    position: absolute;
    left: 30px;
    top: 750px;
}

#mouse-position {
    position: absolute;
    left: 30px;
    top: 670px;
    color: gray;
}
</style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
    
<!--
  This test is modeled after <LayoutTests/fast/events/offsetX-offsetY.html>,
  but it is designed to not depend on inline text content to position the
  targets on which we click.
-->

<!-- Filler, to force scrolling -->
<div id="filler"></div>

<!-- Absolute, Relative, and Fixed position -->
<div id="absolute" class="box target">
    <span style="position:absolute;left:0;top:0">Absolute</span>
    <div id="relative" class="box target">Relative</div>
    <div id="fixed" class="box target">Fixed</div>
</div>

<!-- Table -->
<table id="table" border="2" cellpadding="3" cellpadding="2">
    <tr><th>x</th><th>x</th></tr>
    <tr>
        <td><div id="table-content" class="line target">Table Content</div></td>
        <td>
            <div class="line"></div><div class="line"></div>
            <div class="line"></div><div class="line"></div>
            <div class="line"></div><div class="line"></div>
        </td>
    </tr>
</table>

<!-- Columns -->
<div id="columns">
    <div class="column-line"></div><div class="column-line"></div>
    <div class="column-line"></div><div class="column-line"></div>
    <div class="column-line"></div><div class="column-line"></div>
    <div class="column-line"></div><div class="column-line"></div>
    <div class="column-line"></div><div class="column-line"></div>
    <div class="column-line"></div><div class="column-line"></div>
    <div id="in-columns" class="column-line target">In Columns</div>
    <div class="column-line"></div><div class="column-line"></div>
    <div class="column-line"></div><div class="column-line"></div>
    <div class="column-line"></div><div class="column-line"></div>
    <div class="column-line"></div><div class="column-line"></div>
    <div class="column-line"></div><div class="column-line"></div>
    <div class="column-line"></div><div class="column-line"></div>
    <div class="column-line"></div><div class="column-line"></div>
</div>

<!-- Transformed -->
<div id="transformed" class="box target">Transformed</div>

<!-- Overflowed Content -->
<div id="overflow">
    <div id="overflow-contents">
        <div class="line"></div><div class="line"></div><div class="line"></div>
        <div class="line"></div><div class="line"></div><div class="line"></div>
        <div class="line"></div><div class="line"></div><div class="line"></div>
        <div id="inside-overflow" class="target">In RTL overflow</div>
        <div class="line"></div><div class="line"></div><div class="line"></div>
    </div>
</div>

<!-- Debugging -->
<div id="results"></div>
<div id="mouse-position"></div>

      ''', treeSanitizer: new NullTreeSanitizer());

  var data = {};

  /*
  // Debug mode.
  document.body.onMouseMove.listen((e) {
    var resultBox = document.getElementById('mouse-position');
    var offsets = 'element id: ${e.target.id}<br> clientX: ${e.client.x} clientY: ${e.client.y}<br>';
    offsets += 'offsetX: ${e.offset.x} offsetY: ${e.offset.y}';
    resultBox.innerHtml = offsets;
  });
  */

  dispatchEvent(clientX, clientY, expectedElementID, expectedOffsetX, expectedOffsetY) {
    MouseEvent e = new MouseEvent("click", canBubble: true, cancelable: true,
        view: window, detail: 1,
        screenX: 1, screenY: 1,
        clientX: clientX, clientY: clientY,
        ctrlKey: false, altKey: false, shiftKey: false, metaKey: false,
        button: 0, relatedTarget: document);
    var d = new Data();
    d.expectedElementID = expectedElementID;
    d.expectedOffsetX = expectedOffsetX;
    d.expectedOffsetY = expectedOffsetY;
    data[e] = d;
    var target = document.elementFromPoint(e.client.x, e.client.y);
    target.dispatchEvent(e);   
  }

  clicked(event) {
    var element = event.target;
    var d = data[event];
    shouldBe(element.id, d.expectedElementID);
    shouldBe(event.offset.x, d.expectedOffsetX);
    shouldBe(event.offset.y, d.expectedOffsetY);
  }

  asyncStart();

  // Start the test.
  document.body.addEventListener('click', clicked, false);
  window.addEventListener('load', (_) {
    setTimeout(() {
      // Scroll body and inner overflow box.
      window.scrollTo(20, 100);
      var overflowContent = document.getElementById('overflow');
      overflowContent.scrollLeft = 80;
      overflowContent.scrollTop = 60;
      setTimeout(() {
        // Dispatch events.
        dispatchEvent(109, 57, 'absolute', 29, 32);
        dispatchEvent(161, 13, 'relative', 31, 28);
        dispatchEvent(40, 297, 'table-content', 15, 18);
        dispatchEvent(122, 407, 'transformed', 18, 15);
        dispatchEvent(573, 480, 'inside-overflow', 2, 9);
        dispatchEvent(707, 174, 'in-columns', 87, 13);
        dispatchEvent(241, 67, 'fixed', 41, 17);
        dispatchEvent(244, 102, 'fixed', 44, 52);
        dispatchEvent(388, 88, 'fixed', 188, 38);

        // End asynchronous test.
        asyncEnd();
      }, 0);
    }, 0);
  }, false);
}
