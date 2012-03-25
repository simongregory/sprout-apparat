# The Apparat Sprout Gem

This [RubyGem](http://docs.rubygems.org/read/book/7) contains [rake](http://rake.rubyforge.org/) tasks to add support for [Apparat](https://github.com/joa/apparat#readme) to [Project Sprouts](http://projectsprouts.org).

As I only need this to work on my dev machine there's a good chance you're going to have to do some extra work to get it running.

## Install

    git clone [this repo]
    cd sprout-apparat
    bundle install
    gem build apparat.gemspec
    gem install apparat

#### Or

    gem install apparat

#### You need scala

Until it's bundled with the gem then you need to install [scala 2.8.2](http://www.scala-lang.org/downloads). I had scala 2.9.1 installed via homebrew but it turned out to be incompatible with apparat. So I dropped 2.8.2 into `/usr/local/Cellar/scala` and switched to it with `brew switch scala 2.8.2`

## Usage

Add the following to your rake file

	apparat :coverage do |t|
	end

    apparat :dump do |t|
		t.input = 'input.swf'
		t.output = 'report/'
		t.swf = true
		t.uml = true
		t.abc = [default|raw|cfg]
	end

	apparat :reducer do |t|
		t.input = 'input.swf'
		t.output = 'output.swf'
		t.quality = '0.96'
	end

	apparat :stripper do |t|
		t.input = 'input.swf'
		t.output = 'output.swf' #optional
    end

	apparat :tdsi do |t|
		t.fix = false
		t.alchemy = true
		t.inlined = true
		t.macro = true
	end

## MIT License

Copyright 2012 Simon Gregory

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
