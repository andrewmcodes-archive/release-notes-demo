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
```

You can make sure everything was configured correctly by running `rails server`.
Your app should now be running on [localhost:3000](http://localhost:3000/).

## Configure Gem

Override any of the defaults in `config/initializers/release_notes.rb`

### Side Note

If you clone this repo, the release-notes initializer will already exist, but you can regenerate it by running:

```sh
rails generate release:notes:install
```

## Generate Release Notes

```sh
bin/rails update_release_notes:run
```

## Seed Git Log

To aid in testing this gem's functionality, this repo has a Rake task to generate a fake git log.

**Important:** If you have made any commits that you would like to save, commit and push before running this command!

```sh
rake populate_git_log:run
```

Verify the task was successful by viewing `git log` or the newly generate changelog.

The easiest way to revert the seed is to run:

```sh
git reset --hard origin/master
```
