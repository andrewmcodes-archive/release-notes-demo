# frozen_string_literal: true

namespace :populate_git_log do
  task run: :environment do
    if /git version/.match(`git --version`)
      if `git rev-parse --is-inside-work-tree`.strip == "true"
        Release::Notes.configure { Release::Notes.configuration } unless Release::Notes.configuration
        version = 1
        10.times do |x|
          5.times do |y|
            all_labels = []
            Release::Notes.configure do |config|
              all_labels << config.bug_labels
              all_labels << config.feature_labels
              all_labels << config.misc_labels
            end
            rand_link = Release::Notes.configuration.link_to_labels.sample
            `git add . && git commit --allow-empty -m "Commit #{rand_link + y.to_s} - test commit - #{all_labels.flatten.sample}"`
          end
          `git tag -f v#{x} -m "Version #{x} release"`
        end
      else
        `git init`
      end
    end
  end
end
