# MT Proj Server

A project that is in the making.

### Setting Up

- Install [virtualenv](https://virtualenv.pypa.io/en/stable/)
- `mkvirtualenv -a . mt`
- `pip install -r requirements.txt`
- Clone the [thrift repository](https://github.com/apache/thrift) to be a sibling of this repository

### Local Usage

- `workon mt`
- `python server.py`
- Set up the rest of the stack via [mt-proj-client](https://github.com/todd-beckman/mt-proj-client)

## Thrift Setup

This project makes use of [Apache Thrift](https://thrift.apache.org/) for client-server messaging.
Normally you should not need to install thrift unless you intend on generating code.
However, in order to run this source, you must have a local checkout of the thrift codebase as,
as of this writing, it is not hosted anywhere.

