Ruby Bench [![Build Status](https://travis-ci.org/ruby-bench/ruby-bench.png?branch=master)](https://travis-ci.org/ruby-bench/ruby-bench)
==========

Collecting and displaying benchmarks for Rubies and popular gems.

See http://samsaffron.com/archive/2013/12/11/call-to-action-long-running-ruby-benchmark for further information.

How to install and run
----------------------

```
$ git clone git@github.com:ruby-bench/ruby-bench.git
$ cd ruby-bench
$ cp config/example.database.yml config/database.yml
$ psql postgres
  # create user ruby_bench with password '' CREATEDB;
  # \q
$ brew install qt
$ bundle
$ rake db:create db:migrate
$ rails s
```
