# MT Proj Server

A project that is in the making.

### Setting Up

- Install [virtualenv](https://virtualenv.pypa.io/en/stable/)
- `mkvirtualenv -a . mt`
- `pip install -r requirements.txt`

Optional:

- This project makes use of [Apache Thrift](https://thrift.apache.org/) for client-server messaging. However, because it's such a pain to get this set up to work with Dart, the generated files are committed to this repository. Thus it is not required to set up for purely server-side development. See Thrift Setup below.

### Local Usage

- `workon mt`
- `python server.py`
- Set up the rest of the stack via [mt-proj-client](https://github.com/todd-beckman/mt-proj-client)


## Thrift Setup

Note: Don't worry about this for purely server-side development. Only a full stack needs this.

1. Install thrift. 
1. Clone the [thrift repository](https://github.com/apache/thrift)
1. From `thrift/lib/`, copy `dart` to `thrift_dart` as a sibling to this repository.

    ```
    some_workspace
     |-- mt-proj-server
     |   | -- pubspec.yaml
     |   | -- etc.
     |
     |-- thrift_dart
     |   | -- pubspec.yaml
     |   | -- etc.
    ```