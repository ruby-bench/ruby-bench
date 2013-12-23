Ruby Bench [![Build Status](https://travis-ci.org/ruby-bench/ruby-bench.png?branch=master)](https://travis-ci.org/ruby-bench/ruby-bench)
==========

Collecting and displaying benchmarks for Rubies and popular gems.

* See http://samsaffron.com/archive/2013/12/11/call-to-action-long-running-ruby-benchmark for further information.
* Also see http://community.miniprofiler.com/t/initial-notes-about-the-ui-and-api-project/193 for initial thoughts on the API/UI project.

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

Sending data from a runner
--------------------------

First you need to create a runner in the app with a known token. If you want to send benchmarks again but from a differently spec'ed machine, just create another runner for it.

```
$ rails c
  > Runner.create :name => "Runner 1", :hardware => "xeon xyz 32GB - 2.2GHZ", :token => "123"
```

Then you can post your results for a run, here is a sample cURL request that should work:

```
curl -i -H 'Content-Type: application/json' -H 'Authorization: Token token="123"' -X POST http://localhost:3000/api/v1/results -d "{\"run\":{\"ruby_version\":\"2.0.0-p247\",\"git_hash\":\"c0a04be8ddcadcd89c02bc135e4b288f6d936704\",\"date\":\"2013-12-18T12:09:16+00:00\",\"results_attributes\":[{\"benchmark\":\"some_bench\",\"score\":\"222\"}]}}"
```

Here are the response codes you should expect:

* 204 - No Content - Successfully stored the run data
* 401 - Unauthorized - The token you passed doesn't match a runner.
* 422 - Unprocessable Entity - Validation failed in some way. The response body should contain details of the errors.

How to contribute (core team)
-----------------------------

1. Create a branch for your feature
2. Send a PR with details of change
3. Team (at least one person) reviews and comments/thumbs if all is good
4. When you get a :+1: you can merge into master
5. Delete your branch

Please do not push directly to master :smile:

How to contribute (everyone else)
---------------------------------

1. Fork this repro
2. Create a branch for your feature
3. Send a PR with details of change
4. We will review and comment as required
5. When we are happy we'll merge into master
