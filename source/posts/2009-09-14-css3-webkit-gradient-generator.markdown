---
title: CSS3 Webkit Gradient Generator
category: CSS3
summary: <a href="http://gradients.glrzad.com" title="Visit the generator">Visit the CSS3 Webkit Gradient Generator</a>
date: 2009-09-14 00:22:32 UTC
tags: 
---

<a href="http://gradients.glrzad.com" title="Visit the generator">Visit the CSS3 Webkit Gradient Generator</a>

CSS gradients are quite powerful and very useful, but when taking a first look at the markup for writing a code based gradient it can appear daunting.  This is why I've decided to create the CSS3 Webkit Gradient Generator.   Please note that the generator is intended to be viewed in a webkit browser. Live sampling of the gradient will not be available without a webkit browser.

The gradient generator has 2 goals. The first is to provide a showcase for the power of CSS gradients. The second, is to provide a graphical user interface in which a user can visually create gradient code to use in their CSS where they see fit.  In order to do this, I tried to create a UI that appears familiar, such as that of a graphic editing tool like Adobe Photoshop.  Providing color swatches to make up the gradient and a slider for each to determine the color's position in the gradient.

<img src="http://assets.damiangalarza.com/article-images/css3-gradient-generator/color-swatch-ss.png" title="Color Swatch Control" alt="Color Swatch Control" />

<h3>Color Swatch Control</h3>

Once a color swatch is selected the user can use the color picker found on the right to adjust the swatch's color. The color picker is provided by the ColorPicker jQuery plugin from <a href="http://www.eyecon.ro/colorpicker/" title="jQuery ColorPicker">eyecon.ro</a>.

<img src="http://assets.damiangalarza.com/article-images/css3-gradient-generator/color-picker-ss.png" title="jQuery ColorPicker Plugin" alt="jQuery ColorPicker Plugin"/>

<h3>Gradient Direction Control</h3>

Along with this control, I have added the ability to set the direction of the gradient, allowing the user to take advantage of the keywords that are available (left, right, bottom, top) or use custom point locations.

<img src="http://assets.damiangalarza.com/article-images/css3-gradient-generator/gradient-direction-ss.png" title="Gradient Direction Control" alt="Gradient Direction Control"/>

<h3>Live Sampling</h3>
The generator provides live sampling, meaning any changes that are made to the controls on the page will immediately update the color sample and the CSS code output.
<p class="disclaimer"><strong>Note:</strong> Live sampling of the gradient colors requires a webkit browser.</p>

<img src="http://assets.damiangalarza.com/article-images/css3-gradient-generator/gradient-live-sample-ss.png" title="Live Sampling" alt="Live Sampling"/>

<h3>Coming Soon</h3>
There are still more features to be implemented.  Currently, the gradient generator only supports linear gradients.  I'm working to provide radial gradient support in the near future. Also, currently the generator will only accept hex color values, I am planning on adding RGB support soon as well.

Let me know what you think of the generator so far as well as any features you may like to see.

<h3>Links</h3>
<ul>
<li><a href="http://www.github.com/dgalarza/css3-gradient-generator/" title="GitHub">Check out the code on GitHub</a></li>
<li><a href="http://webkit.org/blog/175/introducing-css-gradients/" title="Learn more about CSS3 Webkit Gradients">Learn more about CSS3 Gradients in Webkit</a></li>
<li><a href="http://gradients.glrzad.com/" title="CSS3 Gradient Generator">Visit the CSS3 Webkit Gradient Generator</a></li>
</ul>
