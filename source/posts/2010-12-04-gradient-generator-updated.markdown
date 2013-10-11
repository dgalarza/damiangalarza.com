---
title: Gradient Generator Updated!
category: CSS3
summary: After about a year since being updated I've just released a long awaited update to the CSS3 Gradient Generator.  This update includes an updated page design as well as some new features.  The biggest of these include the often asked for option of being able to choose HEX colors instead of RGB.  A full list of release notes can be found below.
date: 2010-12-04 21:59:38 UTC
tags: 
---

After about a year since being updated I've just released a long awaited update to the CSS3 Gradient Generator.  This update includes an updated page design as well as some new features.  The biggest of these include the often asked for option of being able to choose HEX colors instead of RGB.  A full list of release notes can be found below.

Along with these changes the public github repository has been restructured. Only the important things (the JavaScript source of course) are up in the repo. Meaning, you can go ahead and browse it, fork it, learn how it works or use in your own project.  Be warned that a lot of the code is pretty specific to the HTML structure of the actual gradients.glrzad.com website. It was never intended to be used as a plugin, though perhaps in the user this will be done.

Check out the changes live, <a href="http://gradients.glrzad.com" title="CSS3 Gradient Generator">visit the CSS3 Gradient Generator</a>.

<h2>Release Notes</h2>

<dl class="release-notes">

	<dt>Color Format Selection</dt>
	<dd>Color format selection: Choose how your colors are formatted, either RGB or HEX.</dd>
	<dd>The gradient generator will store your preference for the next time you visit!</dd>

	<dt>Copy the code!</dt>
	<dd>Copies the output code to your clipboard for you so you can quickly grab your generated code.</dd>

	<dt>UI Updates</dt>
	<dd>Stripped down page to the core components of the gradient generator, moving it to the top of the fold.</dd>
	<dd>Moved the color picker next to the swatches so that when working with swatches, the user doesn't have to travel so far to update the color for their selected swatch.</dd>
	<dd>Larger gradient sample included</dd>
	<dd>Code sample now outputs how you would be expected to use the sample, (includes the background: definition)</dd>

	<dt>Disqus Commenting!</dt>
	<dd>Disqus commenting built onto the page. Like the gradient generator? Want to leave back feedback? You can do so now without having to leave the page to my blog.</dd>

	<dt>Spread the word!</dt>
	<dd>Facebook Like button and Twitter's own retweet button in place (replacing the old TweetMeme button). Share your love for the gradient generator</dd>

	<dt>CDN</dt>
	<dd>All assets have been moved over to an Amazon S3 bucket and make use of Amazon's CloudFront</dd>
	<dd>JavaScript and CSS have been minified for enhanced performance for requests.</dd>

</dl>
