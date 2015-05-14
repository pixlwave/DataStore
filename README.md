# DataStore

A very simple JSON backed data store for RubyMotion, with a settable file name and directory.

## Installation

Add this line to your application's Gemfile:

    gem 'DataStore', github: 'digitalfx/DataStore'

And then execute:

    $ bundle

## Usage

```ruby
DataStore.useName(name, andDirectory: directory)

DataStore.useName(name)
DataStore.useDirectory(directory)

DataStore.valueForKey(key)
DataStore.storeValue(value, forKey: key)
```