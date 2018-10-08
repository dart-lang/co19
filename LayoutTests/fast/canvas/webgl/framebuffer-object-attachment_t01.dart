/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test framebuffer object attachment behaviors
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var gl;
  var fbo,fbo2;
  var depthBuffer;
  var stencilBuffer;
  var depthStencilBuffer;
  var colorBuffer;
  var width;
  var height;

  const ALLOW_COMPLETE              = 0x01;
  const ALLOW_UNSUPPORTED           = 0x02;
  const ALLOW_INCOMPLETE_ATTACHMENT = 0x04;

  checkFramebufferForAllowedStatuses(allowedStatuses)
  {
    // If the framebuffer is in an error state for multiple reasons,
    // we can't guarantee which one will be reported.
    var status = gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER);
    var statusAllowed = ((allowedStatuses & ALLOW_COMPLETE) != 0 && (status == wgl.WebGL.FRAMEBUFFER_COMPLETE)) ||
      ((allowedStatuses & ALLOW_UNSUPPORTED) != 0 && (status == wgl.WebGL.FRAMEBUFFER_UNSUPPORTED)) ||
      ((allowedStatuses & ALLOW_INCOMPLETE_ATTACHMENT) != 0 && (status == wgl.WebGL.FRAMEBUFFER_INCOMPLETE_ATTACHMENT));
    var msg = "gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER) returned $status";
    if (statusAllowed)
      testPassed(msg);
    else
      testFailed(msg);
  }

  checkBufferBits(attachment0, [attachment1=0])
  {
    if (gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER) != wgl.WebGL.FRAMEBUFFER_COMPLETE)
      return;

    var haveDepthBuffer = attachment0 == wgl.WebGL.DEPTH_ATTACHMENT ||
      attachment0 == wgl.WebGL.DEPTH_STENCIL_ATTACHMENT ||
      attachment1 == wgl.WebGL.DEPTH_ATTACHMENT ||
      attachment1 == wgl.WebGL.DEPTH_STENCIL_ATTACHMENT;
    var haveStencilBuffer = attachment0 == wgl.WebGL.STENCIL_ATTACHMENT ||
      attachment0 == wgl.WebGL.DEPTH_STENCIL_ATTACHMENT ||
      attachment1 == wgl.WebGL.STENCIL_ATTACHMENT ||
      attachment1 == wgl.WebGL.DEPTH_STENCIL_ATTACHMENT;

    shouldBeTrue(gl.getParameter(wgl.WebGL.RED_BITS) + gl.getParameter(wgl.WebGL.GREEN_BITS) + gl.getParameter(wgl.WebGL.BLUE_BITS) + gl.getParameter(wgl.WebGL.ALPHA_BITS) >= 16);

    if (haveDepthBuffer)
      shouldBeTrue(gl.getParameter(wgl.WebGL.DEPTH_BITS) >= 16);
    else
      shouldBeTrue(gl.getParameter(wgl.WebGL.DEPTH_BITS) == 0);

    if (haveStencilBuffer)
      shouldBeTrue(gl.getParameter(wgl.WebGL.STENCIL_BITS) >= 8);
    else
      shouldBeTrue(gl.getParameter(wgl.WebGL.STENCIL_BITS) == 0);
  }

  testAttachment(attachment, buffer, allowedStatuses)
  {
    shouldBeNonNull(fbo = gl.createFramebuffer());
    gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo);
    gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, colorBuffer);
    gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, attachment, wgl.WebGL.RENDERBUFFER, buffer);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
    checkFramebufferForAllowedStatuses(allowedStatuses);
    if ((allowedStatuses & ALLOW_COMPLETE) == 0) {
      gl.clear(wgl.WebGL.COLOR_BUFFER_BIT);
      glErrorShouldBe(gl, wgl.WebGL.INVALID_FRAMEBUFFER_OPERATION);
      gl.readPixels(0, 0, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, new Uint8List(width * height * 4));
      glErrorShouldBe(gl, wgl.WebGL.INVALID_FRAMEBUFFER_OPERATION);
    }
    checkBufferBits(attachment);
    gl.deleteFramebuffer(fbo);
  }

  testAttachments(attachment0, buffer0, attachment1, buffer1, allowedStatuses)
  {
    shouldBeNonNull(fbo = gl.createFramebuffer());
    gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo);
    gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, colorBuffer);
    gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, attachment0, wgl.WebGL.RENDERBUFFER, buffer0);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
    gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, attachment1, wgl.WebGL.RENDERBUFFER, buffer1);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
    checkFramebufferForAllowedStatuses(allowedStatuses);
    checkBufferBits(attachment0, attachment1);
    gl.deleteFramebuffer(fbo);
  }

  testColorRenderbuffer(internalformat, allowedStatuses)
  {
    shouldBeNonNull(colorBuffer = gl.createRenderbuffer());
    gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, colorBuffer);
    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, internalformat, width, height);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
    testAttachment(wgl.WebGL.COLOR_ATTACHMENT0, colorBuffer, allowedStatuses);
  }

  testDepthStencilDepthStencil()
  {
    if (width == 0 || height == 0) {
      return;
    }

    var tests = [
    { 'firstFormat': wgl.WebGL.DEPTH_COMPONENT16,
      'firstAttach': wgl.WebGL.DEPTH_ATTACHMENT,
      'secondFormat': wgl.WebGL.DEPTH_STENCIL,
      'secondAttach': wgl.WebGL.DEPTH_STENCIL_ATTACHMENT
    },
    { 'firstFormat': wgl.WebGL.DEPTH_STENCIL,
      'firstAttach': wgl.WebGL.DEPTH_STENCIL_ATTACHMENT,
      'secondFormat': wgl.WebGL.DEPTH_COMPONENT16,
      'secondAttach': wgl.WebGL.DEPTH_ATTACHMENT
    }
    ];
    for (var ii = 0; ii < tests.length; ++ii) {
      var test = tests[ii];
      for (var jj = 0; jj < 2; ++jj) {
        var fbo = gl.createFramebuffer();
        var tex = gl.createTexture();
        var firstRb = gl.createRenderbuffer();
        var secondRb;

        debug("test: ${wtu.glEnumToString(gl, test['firstFormat'])} vs ${wtu.glEnumToString(gl, test['secondFormat'])} with ${jj == 0 ? 'unbind' : 'delete'}");

        gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo);
        // attach texture as color
        gl.bindTexture(wgl.WebGL.TEXTURE_2D, tex);
        gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, width, height, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, null);
        gl.framebufferTexture2D(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.TEXTURE_2D, tex, 0);

        // attach first
        gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, firstRb);
        gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, test['firstFormat'], width, height);
        gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, test['firstAttach'], wgl.WebGL.RENDERBUFFER, firstRb);

        if (gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER) == wgl.WebGL.FRAMEBUFFER_COMPLETE) {
          gl.enable(wgl.WebGL.DEPTH_TEST);
          // Test it works
          wtu.drawUByteColorQuad(gl, [0, 255, 0, 255]);
          wtu.drawUByteColorQuad(gl, [255, 0, 0, 255]);  // should not draw since DEPTH_FUNC == LESS
          wtu.checkCanvasRect(gl, 0, 0, width, height, [0, 255, 0, 255], "should be green");

          secondRb = gl.createRenderbuffer();

          // attach second
          gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, secondRb);
          gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, test['secondFormat'], width, height);
          gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, test['secondAttach'], wgl.WebGL.RENDERBUFFER, secondRb);

          if (jj == 0) {
            // now delete it
            debug("test deleting second renderbuffer");
            gl.deleteRenderbuffer(secondRb);
          } else {
            // unbind it
            debug("test unbinding second renderbuffer");
            gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, test['secondAttach'], wgl.WebGL.RENDERBUFFER, null);
          }

          // If the first attachment is not restored this may fail
          shouldBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);
          glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

          // If the first attachment is not restored this may fail.
          gl.clear(wgl.WebGL.DEPTH_BUFFER_BIT);
          wtu.drawUByteColorQuad(gl, [0, 255, 0, 255]);
          wtu.drawUByteColorQuad(gl, [255, 0, 0, 255]);  // should not draw since DEPTH_FUNC == LESS
          wtu.checkCanvasRect(gl, 0, 0, width, height, [0, 255, 0, 255], "should be green");
          gl.disable(wgl.WebGL.DEPTH_TEST);

          if (jj == 1) {
            gl.deleteRenderbuffer(secondRb);
          }
        }

        gl.deleteRenderbuffer(secondRb);
        gl.deleteFramebuffer(fbo);
      }
    }
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
  }

  testDepthStencilRenderbuffer(allowedStatuses)
  {
    shouldBeNonNull(depthStencilBuffer = gl.createRenderbuffer());
    gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, depthStencilBuffer);
    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.DEPTH_STENCIL, width, height);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

    // OpenGL itself doesn't seem to guarantee that e.g. a 2 x 0
    // renderbuffer will report 2 for its width when queried.
    if (!(height == 0 && width > 0))
      shouldBe(gl.getRenderbufferParameter(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RENDERBUFFER_WIDTH), width);
    if (!(width == 0 && height > 0))
      shouldBe(gl.getRenderbufferParameter(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RENDERBUFFER_HEIGHT), height);
    shouldBe(gl.getRenderbufferParameter(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RENDERBUFFER_INTERNAL_FORMAT), wgl.WebGL.DEPTH_STENCIL);
    shouldBe(gl.getRenderbufferParameter(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RENDERBUFFER_RED_SIZE), 0);
    shouldBe(gl.getRenderbufferParameter(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RENDERBUFFER_GREEN_SIZE), 0);
    shouldBe(gl.getRenderbufferParameter(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RENDERBUFFER_BLUE_SIZE), 0);
    shouldBe(gl.getRenderbufferParameter(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RENDERBUFFER_ALPHA_SIZE), 0);
    // Avoid verifying these for zero-sized renderbuffers for the time
    // being since it appears that even OpenGL doesn't guarantee them.
    if (width > 0 && height > 0) {
      shouldBeTrue(gl.getRenderbufferParameter(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RENDERBUFFER_DEPTH_SIZE) > 0);
      shouldBeTrue(gl.getRenderbufferParameter(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RENDERBUFFER_STENCIL_SIZE) > 0);
    }
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
    testAttachment(wgl.WebGL.DEPTH_STENCIL_ATTACHMENT, depthStencilBuffer, allowedStatuses);
    testDepthStencilDepthStencil();
  }

  for (width = 0; width <= 2; width += 2)
  {
    for (height = 0; height <= 2; height += 2)
    {
      debug("Dimensions $width x $height");

      debug("Create renderbuffers");
      shouldBeNonNull(gl = create3DContext());
      shouldBeNonNull(colorBuffer = gl.createRenderbuffer());
      gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, colorBuffer);
      gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, width, height);
      glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
      shouldBeNonNull(depthBuffer = gl.createRenderbuffer());
      gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, depthBuffer);
      gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.DEPTH_COMPONENT16, width, height);
      glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
      shouldBeNonNull(stencilBuffer = gl.createRenderbuffer());
      gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, stencilBuffer);
      gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.STENCIL_INDEX8, width, height);
      glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
      shouldBeNonNull(depthStencilBuffer = gl.createRenderbuffer());
      gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, depthStencilBuffer);
      gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.DEPTH_STENCIL, width, height);
      glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

      var allowedStatusForGoodCase
        = (width == 0 || height == 0) ? ALLOW_INCOMPLETE_ATTACHMENT : ALLOW_COMPLETE;

      // some cases involving stencil seem to be implementation-dependent
      var allowedStatusForImplDependentCase = allowedStatusForGoodCase | ALLOW_UNSUPPORTED;

      debug("Attach depth using DEPTH_ATTACHMENT");
      testAttachment(wgl.WebGL.DEPTH_ATTACHMENT, depthBuffer, allowedStatusForGoodCase);
      debug("Attach depth using STENCIL_ATTACHMENT");
      testAttachment(wgl.WebGL.STENCIL_ATTACHMENT, depthBuffer, ALLOW_INCOMPLETE_ATTACHMENT);
      debug("Attach depth using DEPTH_STENCIL_ATTACHMENT");
      testAttachment(wgl.WebGL.DEPTH_STENCIL_ATTACHMENT, depthBuffer, ALLOW_INCOMPLETE_ATTACHMENT);
      debug("Attach stencil using STENCIL_ATTACHMENT");
      testAttachment(wgl.WebGL.STENCIL_ATTACHMENT, stencilBuffer, allowedStatusForImplDependentCase);
      debug("Attach stencil using DEPTH_ATTACHMENT");
      testAttachment(wgl.WebGL.DEPTH_ATTACHMENT, stencilBuffer, ALLOW_INCOMPLETE_ATTACHMENT);
      debug("Attach stencil using DEPTH_STENCIL_ATTACHMENT");
      testAttachment(wgl.WebGL.DEPTH_STENCIL_ATTACHMENT, stencilBuffer, ALLOW_INCOMPLETE_ATTACHMENT);
      debug("Attach depthStencil using DEPTH_STENCIL_ATTACHMENT");
      testAttachment(wgl.WebGL.DEPTH_STENCIL_ATTACHMENT, depthStencilBuffer, allowedStatusForGoodCase);
      debug("Attach depthStencil using DEPTH_ATTACHMENT");
      testAttachment(wgl.WebGL.DEPTH_ATTACHMENT, depthStencilBuffer, ALLOW_INCOMPLETE_ATTACHMENT);
      debug("Attach depthStencil using STENCIL_ATTACHMENT");
      testAttachment(wgl.WebGL.STENCIL_ATTACHMENT, depthStencilBuffer, ALLOW_INCOMPLETE_ATTACHMENT);

      var allowedStatusForConflictedAttachment
        = (width == 0 || height == 0) ? ALLOW_UNSUPPORTED | ALLOW_INCOMPLETE_ATTACHMENT
        : ALLOW_UNSUPPORTED;

      debug("Attach depth, then stencil, causing conflict");
      testAttachments(wgl.WebGL.DEPTH_ATTACHMENT, depthBuffer, wgl.WebGL.STENCIL_ATTACHMENT, stencilBuffer, allowedStatusForConflictedAttachment);
      debug("Attach stencil, then depth, causing conflict");
      testAttachments(wgl.WebGL.STENCIL_ATTACHMENT, stencilBuffer, wgl.WebGL.DEPTH_ATTACHMENT, depthBuffer, allowedStatusForConflictedAttachment);
      debug("Attach depth, then depthStencil, causing conflict");
      testAttachments(wgl.WebGL.DEPTH_ATTACHMENT, depthBuffer, wgl.WebGL.DEPTH_STENCIL_ATTACHMENT, depthStencilBuffer, allowedStatusForConflictedAttachment);
      debug("Attach depthStencil, then depth, causing conflict");
      testAttachments(wgl.WebGL.DEPTH_STENCIL_ATTACHMENT, depthStencilBuffer, wgl.WebGL.DEPTH_ATTACHMENT, depthBuffer, allowedStatusForConflictedAttachment);
      debug("Attach stencil, then depthStencil, causing conflict");
      testAttachments(wgl.WebGL.DEPTH_ATTACHMENT, depthBuffer, wgl.WebGL.DEPTH_STENCIL_ATTACHMENT, depthStencilBuffer, allowedStatusForConflictedAttachment);
      debug("Attach depthStencil, then stencil, causing conflict");
      testAttachments(wgl.WebGL.DEPTH_STENCIL_ATTACHMENT, depthStencilBuffer, wgl.WebGL.STENCIL_ATTACHMENT, stencilBuffer, allowedStatusForConflictedAttachment);

      debug("Attach color renderbuffer with internalformat == RGBA4");
      testColorRenderbuffer(wgl.WebGL.RGBA4, allowedStatusForGoodCase);

      debug("Attach color renderbuffer with internalformat == RGB5_A1");
      testColorRenderbuffer(wgl.WebGL.RGB5_A1, allowedStatusForGoodCase);

      debug("Attach color renderbuffer with internalformat == RGB565");
      testColorRenderbuffer(wgl.WebGL.RGB565, allowedStatusForGoodCase);

      debug("Create and attach depthStencil renderbuffer");
      testDepthStencilRenderbuffer(allowedStatusForGoodCase);
    }
  }

  // Determine if we can attach both color and depth or color and depth_stencil
  var depthFormat;
  var depthAttachment;

  checkValidColorDepthCombination() {
    shouldBeNonNull(fbo = gl.createFramebuffer());
    gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo);
    shouldBeNonNull(colorBuffer = gl.createRenderbuffer());
    gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, colorBuffer);
    gl.framebufferRenderbuffer(
        wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, colorBuffer);
    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, 16, 16);

    shouldBeNonNull(depthBuffer = gl.createRenderbuffer());
    gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, depthBuffer);

    tryDepth(try_format, try_attachment) {
      if (depthAttachment) {
        // If we've tried once unattach the old one.
        gl.framebufferRenderbuffer(
            wgl.WebGL.FRAMEBUFFER, depthAttachment, wgl.WebGL.RENDERBUFFER, null);
      }
      depthFormat = try_format;
      depthAttachment = try_attachment;
      gl.framebufferRenderbuffer(
          wgl.WebGL.FRAMEBUFFER, depthAttachment, wgl.WebGL.RENDERBUFFER, depthBuffer);
      gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, depthFormat, 16, 16);
      glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
      return gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER) == wgl.WebGL.FRAMEBUFFER_COMPLETE;
    }

    return tryDepth(wgl.WebGL.DEPTH_COMPONENT16, wgl.WebGL.DEPTH_ATTACHMENT) || tryDepth(wgl.WebGL.DEPTH_STENCIL, wgl.WebGL.DEPTH_STENCIL_ATTACHMENT);
  }

  checkFramebuffer(expected) {
    var actual = gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER);
    var msg = "gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER) should be " + wtu.glEnumToString(gl, expected) + " was " + wtu.glEnumToString(gl, actual);
    if (expected != wgl.WebGL.FRAMEBUFFER_COMPLETE) {
      msg += " or FRAMEBUFFER_UNSUPPORTED";
    }
    if (actual == expected ||
        (expected != wgl.WebGL.FRAMEBUFFER_COMPLETE &&
         actual == wgl.WebGL.FRAMEBUFFER_UNSUPPORTED)) {
           testPassed(msg);
         } else {
           testFailed(msg);
         }
  }

  testUsingIncompleteFramebuffer() {
    testRenderingAndReading() {
      glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
      wtu.drawQuad(gl);
      glErrorShouldBe(gl, wgl.WebGL.INVALID_FRAMEBUFFER_OPERATION, "drawArrays with incomplete framebuffer");
      gl.readPixels(0, 0, 1, 1, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, new Uint8List(4));
      glErrorShouldBe(gl, wgl.WebGL.INVALID_FRAMEBUFFER_OPERATION, "readPixels from incomplete framebuffer");
      // copyTexImage and copyTexSubImage can be either INVALID_FRAMEBUFFER_OPERATION because
      // the framebuffer is invalid OR INVALID_OPERATION because in the case of no attachments
      // the framebuffer is not of a compatible type.
      gl.copyTexSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 0, 0, 0, 0, 1, 1);
      glErrorShouldBe(gl, [wgl.WebGL.INVALID_FRAMEBUFFER_OPERATION, wgl.WebGL.INVALID_OPERATION], "copyTexImage2D from incomplete framebuffer");
      gl.copyTexImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 0, 0, 1, 1, 0);
      glErrorShouldBe(gl, [wgl.WebGL.INVALID_FRAMEBUFFER_OPERATION, wgl.WebGL.INVALID_OPERATION], "copyTexSubImage2D from incomplete framebuffer");
      gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);
      glErrorShouldBe(gl, wgl.WebGL.INVALID_FRAMEBUFFER_OPERATION, "clear with incomplete framebuffer");
    }
    debug("Test drawing or reading from an incomplete framebuffer");
    var tex = gl.createTexture();
    wtu.fillTexture(gl, tex, 1, 1, [0,255,0,255]);

    shouldBeNonNull(fbo = gl.createFramebuffer());
    gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo);
    shouldBeNonNull(colorBuffer = gl.createRenderbuffer());
    gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, colorBuffer);
    gl.framebufferRenderbuffer(
        wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, colorBuffer);
    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, 16, 16);

    shouldBeNonNull(depthBuffer = gl.createRenderbuffer());
    gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, depthBuffer);
    gl.framebufferRenderbuffer(
        wgl.WebGL.FRAMEBUFFER, depthAttachment, wgl.WebGL.RENDERBUFFER, depthBuffer);
    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, depthFormat, 16, 16);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
    checkFramebuffer(wgl.WebGL.FRAMEBUFFER_COMPLETE);

    // We pick this combination because it works on desktop OpenGL but should not work on OpenGL ES 2.0
    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, depthFormat, 32, 16);
    checkFramebuffer(wgl.WebGL.FRAMEBUFFER_INCOMPLETE_DIMENSIONS);
    debug("Drawing or reading from an incomplete framebuffer should generate INVALID_FRAMEBUFFER_OPERATION");
    testRenderingAndReading();

    shouldBeNonNull(fbo2 = gl.createFramebuffer());
    gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo2);
    checkFramebuffer(wgl.WebGL.FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT);
    debug("Drawing or reading from an incomplete framebuffer should generate INVALID_FRAMEBUFFER_OPERATION");
    testRenderingAndReading();

    shouldBeNonNull(colorBuffer = gl.createRenderbuffer());
    gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, colorBuffer);
    gl.framebufferRenderbuffer(
        wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, colorBuffer);
    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, 0, 0);
    debug("Drawing or reading from an incomplete framebuffer should generate INVALID_FRAMEBUFFER_OPERATION");
    testRenderingAndReading();
  }

  testFramebufferIncompleteAttachment() {
    shouldBeNonNull(fbo = gl.createFramebuffer());
    gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo);
    shouldBeNonNull(colorBuffer = gl.createRenderbuffer());
    gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, colorBuffer);
    gl.framebufferRenderbuffer(
        wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, colorBuffer);
    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, 16, 16);
    checkFramebuffer(wgl.WebGL.FRAMEBUFFER_COMPLETE);

    debug("Wrong storage type for type of attachment be FRAMEBUFFER_INCOMPLETE_ATTACHMENT (OpenGL ES 2.0 4.4.5)");
    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, depthFormat, 16, 16);
    checkFramebuffer(wgl.WebGL.FRAMEBUFFER_INCOMPLETE_ATTACHMENT);

    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, 16, 16);
    checkFramebuffer(wgl.WebGL.FRAMEBUFFER_COMPLETE);

    debug("0 size attachment should be FRAMEBUFFER_INCOMPLETE_ATTACHMENT (OpenGL ES 2.0 4.4.5)");
    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, 0, 0);
    checkFramebuffer(wgl.WebGL.FRAMEBUFFER_INCOMPLETE_ATTACHMENT);

    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
  }

  testFramebufferIncompleteMissingAttachment() {
    debug("No attachments should be INCOMPLETE_FRAMEBUFFER_MISSING_ATTACHMENT (OpenGL ES 2.0 4.4.5)");
    shouldBeNonNull(fbo = gl.createFramebuffer());
    gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo);
    checkFramebuffer(wgl.WebGL.FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT);

    shouldBeNonNull(colorBuffer = gl.createRenderbuffer());
    gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, colorBuffer);
    gl.framebufferRenderbuffer(
        wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, colorBuffer);
    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, 16, 16);
    checkFramebuffer(wgl.WebGL.FRAMEBUFFER_COMPLETE);

    gl.framebufferRenderbuffer(
        wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, null);
    checkFramebuffer(wgl.WebGL.FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT);

    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
  }

  testFramebufferIncompleteDimensions() {
    debug("Attachments of different sizes should be FRAMEBUFFER_INCOMPLETE_DIMENSIONS (OpenGL ES 2.0 4.4.5)");

    shouldBeNonNull(fbo = gl.createFramebuffer());
    gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo);
    shouldBeNonNull(colorBuffer = gl.createRenderbuffer());
    gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, colorBuffer);
    gl.framebufferRenderbuffer(
        wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, colorBuffer);
    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, 16, 16);

    shouldBeNonNull(depthBuffer = gl.createRenderbuffer());
    gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, depthBuffer);
    gl.framebufferRenderbuffer(
        wgl.WebGL.FRAMEBUFFER, depthAttachment, wgl.WebGL.RENDERBUFFER, depthBuffer);
    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, depthFormat, 16, 16);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
    checkFramebuffer(wgl.WebGL.FRAMEBUFFER_COMPLETE);

    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, depthFormat, 32, 16);
    checkFramebuffer(wgl.WebGL.FRAMEBUFFER_INCOMPLETE_DIMENSIONS);
    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, depthFormat, 16, 16);
    checkFramebuffer(wgl.WebGL.FRAMEBUFFER_COMPLETE);
    gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, colorBuffer);
    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, 16, 32);
    checkFramebuffer(wgl.WebGL.FRAMEBUFFER_INCOMPLETE_DIMENSIONS);
    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, 16, 16);
    checkFramebuffer(wgl.WebGL.FRAMEBUFFER_COMPLETE);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

    var tex = gl.createTexture();
    gl.bindTexture(wgl.WebGL.TEXTURE_2D, tex);
    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 16, 16, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, null);
    gl.framebufferTexture2D(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.TEXTURE_2D, tex, 0);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
    if (gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER) != wgl.WebGL.FRAMEBUFFER_COMPLETE) {
      return;
    }

    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 32, 16, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, null);
    checkFramebuffer(wgl.WebGL.FRAMEBUFFER_INCOMPLETE_DIMENSIONS);
    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 16, 16, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, null);
    checkFramebuffer(wgl.WebGL.FRAMEBUFFER_COMPLETE);

    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
  }

  if (checkValidColorDepthCombination()) {
    testFramebufferIncompleteDimensions();
    testFramebufferIncompleteAttachment();
    testFramebufferIncompleteMissingAttachment();
    testUsingIncompleteFramebuffer();
  }
}
