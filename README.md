# Release::Notes Demo

![alt](https://img.shields.io/badge/ruby-2.5.3-red.svg?longcache=true&style=for-the-badge)
![alt](https://img.shields.io/badge/rails-5.2.1-red.svg?longcache=true&style=for-the-badge)

Demo project for using the [release-notes gem](https://github.com/dvmonroe/release-notes).

## Getting Started

Make sure you have [Ruby 2.5.3](https://www.ruby-lang.org) and [Bundler](http://bundler.io) installed.

```sh
git clone git@github.com:andrewmcodes/release-notes-demo.git # or clone your own fork
cd release-notes-demo
bundle
rails server
```

Your app should now be running on [localhost:3000](http://localhost:3000/).

## Configure Gem

Override any of the defaults in `config/initializers/release_notes.rb`

## Generate Release Notes

`bin/rails update_release_notes:run`

## Seed Git Log

Coming Soon
