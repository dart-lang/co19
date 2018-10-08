/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test drawImage(canvas) with canvas with different composite
 * modes.
 */
import "dart:html";
import "../../testcommon.dart";
import "resources/canvas-composite-image-common.dart";

main() {
  var style = new Element.html('''
      <style type="text/css">
        body { margin: 5px; font-family: arial,verdana,helvetica; background: #fff; }
        canvas { border: 1px solid #999; }
        canvas#source-canvas { border: none; }
        div { margin: 10px; }
        #output h1 { font-size: medium; font-weight: normal; }
        #output h2 { font-size: small; font-weight: normal; }
        #output div { font-size: small; margin: 0px; }
        #output .pass { color: green; }
        #output .fail { color: rgb(255, 0, 0); }
        #output .error { color: rgb(255, 0, 64); }
        td { padding: 2px 5px; }
        table { border-collapse: collapse; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div>Test Results</div>
      <div><table id='outputtable'></table></div>
      <div>Test Image</div>
      <div><img id = "image" src="data:image/png;base64,
        iVBORw0KGgoAAAANSUhEUgAAAJYAAAA8CAIAAAAL5NQ9AAAACXBIWXMAAAsTAAALEwEAmpwY
        AAAAB3RJTUUH2woaBQc4oLEFpAAAABl0RVh0Q29tbWVudABDcmVhdGVkIHdpdGggR0lNUFeB
        DhcAAACMSURBVHja7dNBEYAgFEVRPhHMYgAzUIsmVnFvB/fsoQb+ObfBmzMvxneW1D1vzz2w
        FiEUQiFEKIRCKIQIhVAIhRChEAqhECIUQiEUQoRCKIRCiFAIhVAIEep3xTWTLzzu5oVCKIRC
        iFAIhVAIEQqhEAohQiEUQiFEKIRCKIQIhVAIhRChEAqhECLUZi3VEwcBMGr1NgAAAABJRU5E
        rkJggg==
      "></div>
      <div>Source Canvas</div>
      <div><canvas id = "source-canvas"></canvas></div>
      <div>Test Output</div>
      <div id='output'></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  drawImage(context, compositeIndex, alpha) {
    context.globalCompositeOperation = compositeTypes[compositeIndex];
    if (alpha)
      context.globalAlpha = 0.5;
    var sourceElement = document.getElementById('source-canvas');
    context.drawImage(sourceElement, 10, 10);
  }

  setupTest() {
    dynamic imageElement = document.getElementById('image');
    dynamic canvas = document.getElementById('source-canvas');
    canvas.width = imageElement.width;
    canvas.height = imageElement.height;
    var context = canvas.getContext('2d');
    context.drawImage(imageElement, 0, 0);
  }

  asyncStart();

  window.onLoad.listen((_) {
    runTest(setupTest,drawImage);
    asyncEnd();
  });
}
