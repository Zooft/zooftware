/**
 * jQuery.ScrollTo
 * Copyright (c) 2007-2008 Ariel Flesler - aflesler(at)gmail(dot)com | http://flesler.blogspot.com
 * Dual licensed under MIT and GPL.
 * Date: 2/19/2008
 *
 * @projectDescription Easy element scrolling using jQuery.
 * http://flesler.blogspot.com/2007/10/jqueryscrollto.html
 * Tested with jQuery 1.2.1. On FF 2.0.0.11, IE 6, Opera 9.22 and Safari 3 beta. on Windows.
 *
 * @author Ariel Flesler
 * @version 1.3.3
 *
 * @id jQuery.scrollTo
 * @id jQuery.fn.scrollTo
 * @param {String, Number, DOMElement, jQuery, Object} target Where to scroll the matched elements.
 *	  The different options for target are:
 *		- A number position (will be applied to all axes).
 *		- A string position ('44', '100px', '+=90', etc ) will be applied to all axes
 *		- A jQuery/DOM element ( logically, child of the element to scroll )
 *		- A string selector, that will be relative to the element to scroll ( 'li:eq(2)', etc )
 *		- A hash { top:x, left:y }, x and y can be any kind of number/string like above.
 * @param {Number} duration The OVERALL length of the animation, this argument can be the settings object instead.
 * @param {Object} settings Hash of settings, optional.
 *	 @option {String} axis Which axis must be scrolled, use 'x', 'y', 'xy' or 'yx'.
 *	 @option {Number} duration The OVERALL length of the animation.
 *	 @option {String} easing The easing method for the animation.
 *	 @option {Boolean} margin If true, the margin of the target element will be deducted from the final position.
 *	 @option {Object, Number} offset Add/deduct from the end position. One number for both axes or { top:x, left:y }.
 *	 @option {Object, Number} over Add/deduct the height/width multiplied by 'over', can be { top:x, left:y } when using both axes.
 *	 @option {Boolean} queue If true, and both axis are given, the 2nd axis will only be animated after the first one ends.
 *	 @option {Function} onAfter Function to be called after the scrolling ends. 
 *	 @option {Function} onAfterFirst If queuing is activated, this function will be called after the first scrolling ends.
 * @return {jQuery} Returns the same jQuery object, for chaining.
 *
 * @example $('div').scrollTo( 340 );
 *
 * @example $('div').scrollTo( '+=340px', { axis:'y' } );
 *
 * @example $('div').scrollTo( 'p.paragraph:eq(2)', 500, { easing:'swing', queue:true, axis:'xy' } );
 *
 * @example var second_child = document.getElementById('container').firstChild.nextSibling;
 *			$('#container').scrollTo( second_child, { duration:500, axis:'x', onAfter:function(){
 *				alert('scrolled!!');																   
 *			}});
 *
 * @example $('div').scrollTo( { top: 300, left:'+=200' }, { offset:-20 } );
 *
 * Notes:
 *  - jQuery.scrollTo will make the whole window scroll, it accepts the same arguments as jQuery.fn.scrollTo.
 *	- If you are interested in animated anchor navigation, check http://jquery.com/plugins/project/LocalScroll.
 *	- The options margin, offset and over are ignored, if the target is not a jQuery object or a DOM element.
 *	- The option 'queue' won't be taken into account, if only 1 axis is given.
 */
(function(a){function c(a){return typeof a=="object"?a:{top:a,left:a}}var b=a.scrollTo=function(a,c,d){b.window().scrollTo(a,c,d)};b.defaults={axis:"y",duration:1},b.window=function(){return a(a.browser.safari?"body":"html")},a.fn.scrollTo=function(d,e,f){typeof e=="object"&&(f=e,e=0),f=a.extend({},b.defaults,f),e=e||f.speed||f.duration,f.queue=f.queue&&f.axis.length>1,f.queue&&(e/=2),f.offset=c(f.offset),f.over=c(f.over);return this.each(function(){function m(c){var d=k?a.browser.opera?document.body:document.documentElement:b;return d["scroll"+c]-d["client"+c]}function l(a){g.animate(j,e,f.easing,a&&function(){a.call(this,d)})}var b=this,g=a(b),h=d,i,j={},k=g.is("html,body");switch(typeof h){case"number":case"string":if(/^([+-]=)?\d+(px)?$/.test(h)){h=c(h);break}h=a(h,this);case"object":if(h.is||h.style)i=(h=a(h)).offset()}a.each(f.axis.split(""),function(a,c){var d=c=="x"?"Left":"Top",e=d.toLowerCase(),n="scroll"+d,o=b[n],p=c=="x"?"Width":"Height",q=p.toLowerCase();i?(j[n]=i[e]+(k?0:o-g.offset()[e]),f.margin&&(j[n]-=parseInt(h.css("margin"+d))||0,j[n]-=parseInt(h.css("border"+d+"Width"))||0),j[n]+=f.offset[e]||0,f.over[e]&&(j[n]+=h[q]()*f.over[e])):j[n]=h[e],/^\d+$/.test(j[n])&&(j[n]=j[n]<=0?0:Math.min(j[n],m(p))),!a&&f.queue&&(o!=j[n]&&l(f.onAfterFirst),delete j[n])}),l(f.onAfter)})}})(jQuery)