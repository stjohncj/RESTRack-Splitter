# RESTRack::Splitter

A library for interacting with RESTful web services with automatic distribution across multiple nodes of a cluster.
Use this to communicate with RESTRack based services.


## Usage
    
    uri = URI.new('http://localhost')
    client = RESTRack::Splitter.new(uri)
    client = RESTRack::Splitter.new('http://localhost')
    foo_resource = client.foo(123)                                    # pivot object that hasn't yet made request
    foo = foo_resource.get( { :data => 'something_here' } )           # request is made to GET /foo/123, foo will be an array of responses
    bar = client.foo(123).bar                                         # pivot object that hasn't yet made request
    bar.delete                                                        # request is made to DELETE /foo/123/bar from each node
    bar = client.foo(123).bar.post( { :data => 'something_here' } )   # request is made to POST /foo/123/bar, bar will be an array of responses


## License

Copyright (c) 2011 Chris St. John

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
