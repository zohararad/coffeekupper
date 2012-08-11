# CoffeeKupper

CoffeeKupper is a CoffeeKup template parser for Rails Asset-Pipeline. With CoffeeKupper you can write CoffeeKup templates
in your Rails app, and serve them via your asset pipeline.

CoffeeKupper is just a wrapper around CoffeeKup that breaks your template file into a string that is then fed into the `CoffeeKup.compile` method.
This means you can use your CoffeeKupper templates as you would use any CoffeeKup template.

You should check out the [CoffeeKup Website](http://coffeekup.org) for more details on how to use CoffeeKup.

## Installation

Add this line to your application's Gemfile:

    gem 'coffeekupper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coffeekupper

## Usage

### Basic Concepts

The best way to use CoffeeKup templates (powered by CoffeeKupper), is to write them as JST files. In case you're not familiar with
Sprockets' JST, by adding a `.jst` extention to your Javascript files, Sprockets will serve them in a special way, that will make each
file available under the global JST object. Think of it as a global way to access encapsulated templates.

To serve a CoffeeKup template from Rails, lets assume you have a `views` directory under `app/assets/javascripts`. Add a
CoffeeKup template file to that directory and give it a name (for example, name your file `my_first_view.jst.ck`). Note the
addition of `.jst` before the `.ck` file extension. This will tell Sprockets to add the template to the global JST object.

Now, add a bit of CoffeeKup code. Maybe something along the lines of:
```coffeescript
h1 -> 'Hello CoffeKupper'
p ->
  'I would love to hear some more from you'
```

If you point your browser to `http://localhost:3000/assets/views/my_first_view.js` you'll see the JST version of your template.

Sweet, right?

### Adding to the asset pipeline

To actually use the template in your app, add the following lines to your `application.js` (or any other Javascript file that has been added to the Asset Pipeline):

```
//browser version of CoffeeScript (available from CoffeeKupper vendor/assets)
//= require coffee-script
//browser version of CoffeeKup (available from CoffeeKupper vendor/assets)
//= require coffeekup
//= require_tree ./views
```

When you actually want to render your template from another Javascript file, simply call:

```javascript
var html = JST['views/my_first_view']()
```

### Passing template variables

Passing variables to your template is easy. Just add them as an object to the template call.

Assumming we have the following CoffeeKup template:

```coffeescript
header ->
  h1 -> @title
  h2 -> @subtitle
p ->
  @text
```

We can pass the right variables to the template like this:

```javascript
var html = JST['views/my_first_view']({title:"Some title", subtitle:"Some subtitle", text:"Some text"})
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright (c) 2012 Zohar Arad <zohar@zohararad.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
