/**
 * jQuery.LocalScroll
 * Copyright (c) 2007-2008 Ariel Flesler - aflesler(at)gmail(dot)com | http://flesler.blogspot.com
 * Dual licensed under MIT and GPL.
 * Date: 6/3/2008
 *
 * @projectDescription Animated scrolling navigation, using anchors.
 * http://flesler.blogspot.com/2007/10/jquerylocalscroll-10.html
 * @author Ariel Flesler
 * @version 1.2.6
 *
 * @id jQuery.fn.localScroll
 * @param {Object} settings Hash of settings, it is passed in to jQuery.ScrollTo, none is required.
 * @return {jQuery} Returns the same jQuery object, for chaining.
 *
 * @example $('ul.links').localScroll();
 *
 * @example $('ul.links').localScroll({ filter:'.animated', duration:400, axis:'x' });
 *
 * @example $.localScroll({ target:'#pane', axis:'xy', queue:true, event:'mouseover' });
 *
 * Notes:
 *	- The plugin requires jQuery.ScrollTo.
 *	- The hash of settings, is passed to jQuery.ScrollTo, so the settings are valid for that plugin as well.
 *	- jQuery.localScroll can be used if the desired links, are all over the document, it accepts the same settings.
 *  - If the setting 'lazy' is set to true, then the binding will still work for later added anchors.
 *  - The setting 'speed' is deprecated, use 'duration' instead.
 *	- If onBefore returns false, the event is ignored.
 **/
(function(a){function d(b,c,d){var e=c.hash.slice(1),f=document.getElementById(e)||document.getElementsByName(e)[0];if(f){b&&b.preventDefault();var g=a(d.target||a.scrollTo.window());if(d.lock&&g.is(":animated")||d.onBefore&&d.onBefore.call(c,b,f,g)===!1)return;d.stop&&g.queue("fx",[]).stop(),g.scrollTo(f,d).trigger("notify.serialScroll",[f]),d.hash&&g.queue(function(){location=c.hash,a(this).dequeue()})}}var b=location.href.replace(/#.*/,""),c=a.localScroll=function(b){a("body").localScroll(b)};c.defaults={duration:1e3,axis:"y",event:"click",stop:!0},c.hash=function(b){b=a.extend({},c.defaults,b),b.hash=!1,location.hash&&setTimeout(function(){d(0,location,b)},0)},a.fn.localScroll=function(e){function f(){return!!this.href&&!!this.hash&&this.href.replace(this.hash,"")==b&&(!e.filter||a(this).is(e.filter))}e=a.extend({},c.defaults,e);return e.persistent||e.lazy?this.bind(e.event,function(b){var c=a([b.target,b.target.parentNode]).filter(f)[0];c&&d(b,c,e)}):this.find("a,area").filter(f).bind(e.event,function(a){d(a,this,e)}).end().end()}})(jQuery)