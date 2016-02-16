/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests framebuffer/renderbuffer-related functions
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      <canvas id="canvas" width="2" height="2"> </canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  debug("Canvas.getContext");

  var canvas = document.getElementById("canvas");
  var gl = create3DContext(canvas);
  if (gl == null) {
    testFailed("context does not exist");
  } else {
    testPassed("context exists");

    debug("Checking framebuffer/renderbuffer stuff.");

    var value = gl.getFramebufferAttachmentParameter(
        wgl.FRAMEBUFFER,
        wgl.COLOR_ATTACHMENT0,
        wgl.FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE);
    assertMsg(gl.getError() == wgl.INVALID_OPERATION,
        "calling getFramebufferAttachmentParameter on the default framebuffer should generate INVALID_OPERATION.");

    assertMsg(gl.checkFramebufferStatus(wgl.FRAMEBUFFER) == wgl.FRAMEBUFFER_COMPLETE,
        "calling checkFramebufferStatus on the default framebuffer should generate FRAMEBUFFER_COMPLETE.");

    var tex = gl.createTexture();
    gl.bindTexture(wgl.TEXTURE_2D, tex);
    gl.texParameteri(wgl.TEXTURE_2D, wgl.TEXTURE_MIN_FILTER, wgl.NEAREST);
    gl.texParameteri(wgl.TEXTURE_2D, wgl.TEXTURE_MAG_FILTER, wgl.NEAREST);
    gl.texParameteri(wgl.TEXTURE_2D, wgl.TEXTURE_WRAP_S, wgl.CLAMP_TO_EDGE);
    gl.texParameteri(wgl.TEXTURE_2D, wgl.TEXTURE_WRAP_T, wgl.CLAMP_TO_EDGE);
    gl.texImage2D(wgl.TEXTURE_2D,
        0,                 // level
        wgl.RGBA,          // internalFormat
        canvas.width,      // width
        canvas.height,     // height
        0,                 // border
        wgl.RGBA,          // format
        wgl.UNSIGNED_BYTE, // type
        null);             // data
    gl.framebufferTexture2D(
        wgl.FRAMEBUFFER,
        wgl.COLOR_ATTACHMENT0,
        wgl.TEXTURE_2D,
        tex,
        0);
    assertMsg(gl.getError() == wgl.INVALID_OPERATION,
        "trying to attach a texture to default framebuffer should generate INVALID_OPERATION.");

    gl.framebufferRenderbuffer(
        wgl.FRAMEBUFFER,
        wgl.COLOR_ATTACHMENT0,
        wgl.RENDERBUFFER,
        null);
    assertMsg(gl.getError() == wgl.INVALID_OPERATION,
        "trying to detach default renderbuffer from default framebuffer should generate INVALID_OPERATION.");

    var rb = gl.createRenderbuffer();
    gl.bindRenderbuffer(wgl.RENDERBUFFER, rb);
    gl.renderbufferStorage(wgl.RENDERBUFFER, wgl.RGBA4, canvas.width, canvas.height);
    assertMsg(gl.getError() == wgl.NO_ERROR,
        "allocating renderbuffer storage of a newly created renderbuffer should succeed.");

    gl.framebufferRenderbuffer(
        wgl.FRAMEBUFFER,
        wgl.COLOR_ATTACHMENT0,
        wgl.RENDERBUFFER,
        rb);
    assertMsg(gl.getError() == wgl.INVALID_OPERATION,
        "trying to attach a renderbuffer to the default framebuffer should generate INVALID_OPERATION.");

    var fbtex = gl.createTexture();
    gl.bindTexture(wgl.TEXTURE_2D, fbtex);
    gl.texImage2D(wgl.TEXTURE_2D, 0, wgl.RGBA, canvas.width, canvas.height, 0, wgl.RGBA, wgl.UNSIGNED_BYTE, null);
    var fb = gl.createFramebuffer();

    gl.bindFramebuffer(wgl.FRAMEBUFFER, fb);
    assertMsg(gl.getError() == wgl.NO_ERROR,
        "binding a newly created framebuffer should succeed.");

    var target = 0x8CA8; // GL_READ_FRAMEBUFFER
    gl.getFramebufferAttachmentParameter(
        target,
        wgl.COLOR_ATTACHMENT0,
        wgl.FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE);
    assertMsg(gl.getError() == wgl.INVALID_ENUM,
        "calling getFramebufferAttachmentParameter with target = READ_FRAMEBUFFER should generate INVALID_ENUM.");
    assertMsg(gl.checkFramebufferStatus(target) == 0,
        "calling checkFramebufferStatus with target = READ_FRAMEBUFFER should return 0.");
    assertMsg(gl.getError() == wgl.INVALID_ENUM,
        "calling checkFramebufferStatus with target = READ_FRAMEBUFFER should generate INVALID_ENUM.");
    gl.bindFramebuffer(target, gl.createFramebuffer());
    assertMsg(gl.getError() == wgl.INVALID_ENUM,
        "calling bindFramebuffer with target = READ_FRAMEBUFFER should generate INVALID_ENUM.");
    assertMsg(fb == gl.getParameter(wgl.FRAMEBUFFER_BINDING),
        "calling bindFramebuffer with target = READ_FRAMEBUFFER should not change FRAMEBUFFER_BINDING.");
    gl.getFramebufferAttachmentParameter(target, wgl.COLOR_ATTACHMENT0, wgl.FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE);
    assertMsg(gl.getError() == wgl.INVALID_ENUM,
        "calling getFramebufferAttachmentParameter with target = READ_FRAMEBUFFER should generate INVALID_ENUM.");
    gl.framebufferTexture2D(target, wgl.COLOR_ATTACHMENT0, wgl.TEXTURE_2D, fbtex, 0);
    assertMsg(gl.getError() == wgl.INVALID_ENUM,
        "calling framebufferTexImage2D with target = READ_FRAMEBUFFER should generate INVALID_ENUM.");
    gl.framebufferRenderbuffer(target, wgl.COLOR_ATTACHMENT0, wgl.RENDERBUFFER, rb);
    assertMsg(gl.getError() == wgl.INVALID_ENUM,
        "calling framebufferRenderbuffer with target = READ_FRAMEBUFFER should generate INVALID_ENUM.");

    var attachment = 0x8CE1; // GL_COLOR_ATTACHMENT1
    gl.framebufferTexture2D(wgl.FRAMEBUFFER, attachment, wgl.TEXTURE_2D, fbtex, 0);
    assertMsg(gl.getError() == wgl.INVALID_ENUM,
        "calling framebufferTexImage2D with attachment = COLOR_ATTACHMENT1 should generate INVALID_ENUM.");
    gl.framebufferRenderbuffer(wgl.FRAMEBUFFER, attachment, wgl.RENDERBUFFER, rb);
    assertMsg(gl.getError() == wgl.INVALID_ENUM,
        "calling framebufferRenderbuffer with attachment = COLOR_ATTACHMENT1 should generate INVALID_ENUM.");

    gl.getFramebufferAttachmentParameter(wgl.FRAMEBUFFER,
        wgl.COLOR_ATTACHMENT0,
        0x8210); // GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING
    assertMsg(gl.getError() == wgl.INVALID_ENUM,
        "calling getFramebufferAttachmentParameter with pname = GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING should generate INVALID_ENUM.");

    gl.framebufferTexture2D(wgl.FRAMEBUFFER, wgl.COLOR_ATTACHMENT0, wgl.TEXTURE_2D, fbtex, 0);
    assertMsg(gl.getError() == wgl.NO_ERROR,
        "attaching a texture to a framebuffer should succeed.");

    gl.framebufferTexture2D(wgl.FRAMEBUFFER, wgl.COLOR_ATTACHMENT0, wgl.TEXTURE_2D, null, 0);
    assertMsg(gl.getError() == wgl.NO_ERROR,
        "detaching a texture from a framebuffer should succeed.");

    gl.framebufferTexture2D(wgl.FRAMEBUFFER, wgl.COLOR_ATTACHMENT0, wgl.TEXTURE_2D, fbtex, 1);
    assertMsg(gl.getError() == wgl.INVALID_VALUE,
        "calling framebufferTexture2D with non-zero mipmap level should generate INVALID_VALUE.");

    gl.framebufferRenderbuffer(wgl.FRAMEBUFFER, wgl.COLOR_ATTACHMENT0, wgl.RENDERBUFFER, rb);
    assertMsg(gl.getError() == wgl.NO_ERROR,
        "attaching a renderbuffer to a framebuffer should succeed.");

    gl.framebufferRenderbuffer(wgl.FRAMEBUFFER, wgl.COLOR_ATTACHMENT0, wgl.RENDERBUFFER, null);
    assertMsg(gl.getError() == wgl.NO_ERROR,
        "detaching a renderbuffer from a framebuffer should succeed.");

    gl.bindFramebuffer(wgl.FRAMEBUFFER, null);
    assertMsg(gl.getError() == wgl.NO_ERROR,
        "binding default (null) framebuffer should succeed.");
  }
}
